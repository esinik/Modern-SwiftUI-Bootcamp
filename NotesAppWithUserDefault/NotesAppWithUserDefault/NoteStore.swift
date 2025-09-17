//
//  NoteStore.swift
//  NotesAppWithUserDefault
//
//  Created by Ertan Şinik on 15.09.2025.
//


import Foundation
import Combine

final class NoteStore: ObservableObject {
    @Published var notes: [Note] = [] {
        didSet { save() }
    }
    
    private let storageKey = "NotesAppNotes"
    
    init() { load() }
    
    // CRUD
    func add(title: String, content: String) {
        var note = Note(title: title, content: content)
        note.date = Date()
        notes.insert(note, at: 0)
    }
    
    func delete(at offsets: IndexSet) {
        notes.remove(atOffsets: offsets)
    }
    
    func update(_ note: Note, title: String, content: String) {
        if let idx = notes.firstIndex(where: { $0.id == note.id }) {
            var updated = notes[idx]
            updated.title = title
            updated.content = content
            updated.date = Date()
            notes[idx] = updated
        }
    }
    
    // Persistence
    private func save() {
        do {
            let data = try JSONEncoder().encode(notes)
            UserDefaults.standard.set(data, forKey: storageKey)
        } catch {
            print("NoteStore :: Save error: \(error)")
        }
    }
    
    private func load() {
        guard let data = UserDefaults.standard.data(forKey: storageKey) else { return }
        do {
            notes = try JSONDecoder().decode([Note].self, from: data)
        } catch {
            print("NoteStore :: Load error: \(error)")
            notes = []
        }
    }
}
