//
//  NoteDetailView.swift
//  NotesAppWithUserDefault
//
//  Created by Ertan Şinik on 15.09.2025.
//


import SwiftUI

struct NoteDetailView: View {
    @EnvironmentObject private var store: NoteStore
    let note: Note
    @State private var isEditing: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(note.date.formatted(.dateTime.day().month(.wide).year().hour().minute()))
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Spacer()
            }
            .padding(.horizontal)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text(note.title)
                        .font(.title2.weight(.semibold))
                    Text(note.content)
                        .font(.body)
                        .textSelection(.enabled)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
        .navigationTitle("Not Detayı")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Menu {
                    Button {
                        isEditing = true
                    } label: {
                        Label("Düzenle", systemImage: "pencil")
                    }
                } label: {
                    Image(systemName: "ellipsis.circle")
                }
            }
        }
        .sheet(isPresented: $isEditing) {
            EditNoteView(note: note)
        }
    }
}

// MARK: - Previews
#if DEBUG
struct NotesApp_Previews: PreviewProvider {
    static var previews: some View {
        let store = NoteStore()
        store.notes = [
            Note(title: "Alışveriş", content: "Süt, yumurta, ekmek"),
            Note(title: "Toplantı Notları", content: "SwiftUI MVVM, UserDefaults, Codable"),
        ]
        return NotesListView().environmentObject(store)
    }
}
#endif
