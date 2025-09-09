//
//  Event.swift
//  FormModalDetail
//
//  Created by Ertan Şinik on 9.09.2025.
//

import Foundation

enum EventType: String, CaseIterable, Identifiable, Codable {
    case birthday = "Doğum Günü"
    case meeting  = "Toplantı"
    case holiday  = "Tatil"
    case sport    = "Spor"
    case other    = "Diğer"

    var id: String { rawValue }
}

struct Event: Identifiable, Equatable, Codable, Hashable {
    var id: UUID = UUID()
    var title: String
    var date: Date
    var type: EventType
    var hasReminder: Bool
}
