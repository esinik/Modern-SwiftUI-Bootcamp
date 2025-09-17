//
//  EditNoteView.swift
//  NotesAppWithUserDefault
//
//  Created by Ertan Şinik on 15.09.2025.
//

import SwiftUI

struct EditNoteView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var store: NoteStore
    let note: Note
    @State private var title: String
    @State private var content: String
    
    init(note: Note) {
        self.note = note
        _title = State(initialValue: note.title)
        _content = State(initialValue: note.content)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Başlık") { TextField("Başlık", text: $title) }
                Section("İçerik") { TextEditor(text: $content).frame(minHeight: 160) }
            }
            .navigationTitle("Notu Düzenle")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) { Button("Vazgeç") { dismiss() } }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Kaydet") { save() }
                        .disabled(title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
            }
        }
    }
    
    private func save() {
        store.update(note, title: title, content: content)
        dismiss()
    }
}
