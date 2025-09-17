//
//  NotesAppWithCoreDataApp.swift
//  NotesAppWithCoreData
//
//  Created by Ertan Şinik on 16.09.2025.
//

import SwiftUI

@main
struct NotesAppWithCoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
