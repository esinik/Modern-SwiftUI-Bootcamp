//
//  NotesAppWithUserDefaultApp.swift
//  NotesAppWithUserDefault
//
//  Created by Ertan Şinik on 15.09.2025.
//

import SwiftUI

@main
struct NotesApp: App {
    @StateObject private var store = NoteStore()
    
    var body: some Scene {
        WindowGroup {
            NotesListView()
                .environmentObject(store)
        }
    }
}
