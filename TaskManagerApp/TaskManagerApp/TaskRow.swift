//
//  TaskRow.swift
//  TaskManagerApp
//
//  Created by Ertan Şinik on 5.09.2025.
//

import SwiftUI

struct TaskRow: View {
    let task: TaskItem
    let onToggle: () -> Void

    var body: some View {
        HStack(spacing: 12) {
            Button(action: onToggle) {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                    .imageScale(.large)
                    .symbolRenderingMode(.monochrome)
                    .foregroundStyle(task.isCompleted ? .green : .secondary)
            }
            .buttonStyle(.plain)

            Text(task.title)
                .strikethrough(task.isCompleted, color: .secondary)
                .foregroundStyle(task.isCompleted ? .secondary : .primary)
                .lineLimit(2)

            Spacer()
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    TaskRow(task: TaskItem(title: "Örnek görev"), onToggle: {})
        .padding()
}
