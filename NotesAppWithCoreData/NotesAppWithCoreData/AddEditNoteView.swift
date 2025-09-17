//
//  AddEditNoteView.swift
//  NotesAppWithCoreData
//
//  Created by Ertan Şinik on 16.09.2025.
//

import SwiftUI
import CoreData

struct AddEditNoteView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.managedObjectContext) private var context
    var note: NoteEntity?

    @State private var title: String = ""
    @State private var content: String = ""

    private var isEditing: Bool { note != nil }

    var body: some View {
        NavigationStack {
            Form {
                Section("Başlık") {
                    TextField("Not başlığı", text: $title)
                        .textInputAutocapitalization(.sentences)
                }
                Section("İçerik") {
                    TextEditor(text: $content)
                        .frame(minHeight: 160)
                        .overlay(alignment: .topLeading) {
                            if content.isEmpty {
                                Text("Not içeriği…")
                                    .foregroundStyle(.secondary)
                                    .padding(.top, 8)
                                    .padding(.leading, 5)
                            }
                        }
                }
            }
            .navigationTitle(isEditing ? "Notu Düzenle" : "Yeni Not")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(isEditing ? "Kaydet" : "Ekle") {
                        upsert()
                    }
                    .disabled(title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
            }
            .onAppear {
                if let note {
                    title = note.title ?? ""
                    content = note.content ?? ""
                }
            }
        }
    }

    private func upsert() {
        let trimmedTitle = title.trimmingCharacters(in: .whitespacesAndNewlines)

        if let note {
            // UPDATE
            note.title = trimmedTitle
            note.content = content
            note.date = note.date ?? Date()
        } else {
            // CREATE
            let newNote = NoteEntity(context: context)
            newNote.id = UUID()
            newNote.title = trimmedTitle
            newNote.content = content
            newNote.date = Date()
        }

        do {
            try context.save()
            dismiss()
        } catch {
            print("Kaydetme hatası: \(error)")
        }
    }
}
