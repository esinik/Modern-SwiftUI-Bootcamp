//
//  NoteEntity+CoreDataProperties.swift
//  NotesAppWithCoreData
//
//  Created by Ertan Şinik on 16.09.2025.
//
//

import Foundation
import CoreData


extension NoteEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NoteEntity> {
        return NSFetchRequest<NoteEntity>(entityName: "NoteEntity")
    }

    @NSManaged public var content: String?
    @NSManaged public var date: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var title: String?

}

extension NoteEntity : Identifiable {

}
