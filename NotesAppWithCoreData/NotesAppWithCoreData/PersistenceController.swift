//
//  PersistentController.swift
//  NotesAppWithCoreData
//
//  Created by Ertan Şinik on 16.09.2025.
//

import CoreData
struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init() {

        let modelName = "NoteEntity"

        container = NSPersistentContainer(name: modelName)
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error while loading model \(modelName): \(error), \(error.userInfo)")
            }
        }

        container.viewContext.mergePolicy = NSMergeByPropertyStoreTrumpMergePolicy
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
