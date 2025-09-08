//
//  ContentView.swift
//  TaskManagerApp
//
//  Created by Ertan Şinik on 5.09.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = TaskViewModel()
    @State private var newTitle: String = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                // Yeni görev girişi
                HStack {
                    TextField("Yeni görev ekle…", text: $newTitle)
                        .textFieldStyle(.roundedBorder)
                        .submitLabel(.done)
                        .onSubmit { add() }

                    Button(action: add) {
                        Image(systemName: "plus.circle.fill")
                            .imageScale(.large)
                    }
                    .disabled(newTitle.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
                .padding(.horizontal)
                .padding(.top)
                .background(Color.clear)

                // Liste
                List {
                    ForEach(vm.sortedTasks) { task in
                        TaskRow(task: task) {
                            vm.toggleCompletion(for: task)
                        }
                    }
                    .onDelete(perform: vm.delete)
                }
                .background(Color.clear)
                

            }
            .navigationTitle("Görevler")
            .toolbar {
                EditButton()
            }
            
        }
        .background(Color.gray.opacity(0.1))
    }

    private func add() {
        vm.addTask(title: newTitle)
        newTitle = ""
    }
}

#Preview {
    ContentView()
}
