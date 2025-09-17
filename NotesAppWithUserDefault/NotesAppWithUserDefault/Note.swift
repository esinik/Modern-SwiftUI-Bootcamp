//
//  Note.swift
//  NotesAppWithUserDefault
//
//  Created by Ertan Şinik on 15.09.2025.
//

import Foundation

struct Note: Identifiable, Codable, Equatable, Hashable {
    var id: UUID = UUID()
    var title: String
    var content: String
    var date: Date = Date()
}
