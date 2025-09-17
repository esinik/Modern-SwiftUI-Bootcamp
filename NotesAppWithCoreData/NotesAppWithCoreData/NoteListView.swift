//
//  NoteListView.swift
//  NotesAppWithCoreData
//
//  Created by Ertan Şinik on 16.09.2025.
//

import SwiftUI
import CoreData

struct NotesListView: View {
    @Environment(\.managedObjectContext) private var context

    @FetchRequest var notes: FetchedResults<NoteEntity>

    init(searchText: String) {
        let request: NSFetchRequest<NoteEntity> = NoteEntity.fetchRequest()

        request.sortDescriptors = [
            NSSortDescriptor(key: "date",  ascending: false),
            NSSortDescriptor(key: "title", ascending: true)
        ]

        if !searchText.isEmpty {
            request.predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        }

        _notes = FetchRequest<NoteEntity>(
            fetchRequest: request,
            animation: .default
        )
    }

    var body: some View {
        List {
            ForEach(notes) { note in
                NavigationLink {
                    AddEditNoteView(note: note)
                } label: {
                    NoteRow(note: note)
                }
            }
            .onDelete(perform: delete)
        }
        .listStyle(.inset)
    }

    private func delete(at offsets: IndexSet) {
        for index in offsets {
            let note = notes[index]
            context.delete(note)
        }
        save()
    }

    private func save() {
        do {
            try context.save()
        } catch {
            print("Silme kaydetme hatası: \(error)")
        }
    }
}
