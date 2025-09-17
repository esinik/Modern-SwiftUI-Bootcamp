//
//  AddNoteView.swift
//  NotesAppWithUserDefault
//
//  Created by Ertan Şinik on 15.09.2025.
//


import SwiftUI

struct AddNoteView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var store: NoteStore
    @State private var title: String = ""
    @State private var content: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Başlık") {
                    TextField("Örn: Alışveriş listesi", text: $title)
                        .textInputAutocapitalization(.sentences)
                }
                Section("İçerik") {
                    TextEditor(text: $content)
                        .frame(minHeight: 160)
                }
            }
            .navigationTitle("Yeni Not")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Vazgeç") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Kaydet") { save() }
                        .disabled(title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
            }
        }
    }
    
    private func save() {
        let trimmedTitle = title.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedTitle.isEmpty else { return }
        store.add(title: trimmedTitle, content: content)
        dismiss()
    }
}
