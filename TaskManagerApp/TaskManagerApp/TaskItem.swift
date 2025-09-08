//
//  Untitled.swift
//  TaskManagerApp
//
//  Created by Ertan Şinik on 5.09.2025.
//

import Foundation

struct TaskItem: Identifiable, Hashable, Codable {
    let id: UUID
    var title: String
    var isCompleted: Bool

    init(id: UUID = UUID(), title: String, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
}
