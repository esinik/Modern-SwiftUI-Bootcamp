//
//  NoteListView.swift
//  NotesAppWithUserDefault
//
//  Created by Ertan Şinik on 15.09.2025.
//


import SwiftUI

struct NotesListView: View {
    @EnvironmentObject private var store: NoteStore
    @State private var showAddSheet = false
    
    var body: some View {
        NavigationStack {
            Group {
                if store.notes.isEmpty {
                    ContentUnavailableView(
                        "Henüz not yok",
                        systemImage: "note.text",
                        description: Text("Yeni bir not eklemek için sağ üstteki + butonuna dokun.")
                    )
                } else {
                    List {
                        ForEach(store.notes) { note in
                            NavigationLink(value: note) {
                                NoteRow(note: note)
                            }
                        }
                        .onDelete(perform: store.delete)
                    }
                    .listStyle(.insetGrouped)
                }
            }
            .navigationTitle("Notlar")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showAddSheet = true
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                    }
                    .accessibilityLabel("Yeni Not Ekle")
                }
            }
            .sheet(isPresented: $showAddSheet) {
                AddNoteView()
            }
            .navigationDestination(for: Note.self) { note in
                NoteDetailView(note: note)
            }
        }
    }
}
