//
//  TaskViewModel.swift
//  TaskManagerApp
//
//  Created by Ertan Şinik on 5.09.2025.
//

import Foundation
import Combine

final class TaskViewModel: ObservableObject {
    @Published private(set) var tasks: [TaskItem] = []

    // İstersen başlangıç verisi:
    init() {
        self.tasks = [
            TaskItem(title: "SwiftUI ödevini bitir"),
            TaskItem(title: "Erkenden yat"),
            TaskItem(title: "30 dk kitap oku", isCompleted: true)
        ]
    }

    func addTask(title: String) {
        let trimmed = title.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        tasks.insert(TaskItem(title: trimmed), at: 0)
    }

    func toggleCompletion(for task: TaskItem) {
        guard let idx = tasks.firstIndex(of: task) else { return }
        tasks[idx].isCompleted.toggle()
    }

    func delete(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }

    // İsteğe bağlı: tamamlananları en alta taşı
    var sortedTasks: [TaskItem] {
        tasks.sorted { a, b in
            if a.isCompleted == b.isCompleted {
                return a.title.lowercased() < b.title.lowercased()
            }
            return a.isCompleted == false && b.isCompleted == true
        }
    }
}
