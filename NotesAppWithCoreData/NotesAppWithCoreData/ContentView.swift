//
//  ContentView.swift
//  NotesAppWithCoreData
//
//  Created by Ertan Şinik on 16.09.2025.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var searchText: String = ""
    @State private var isPresentingAdd: Bool = false

    var body: some View {
        NavigationStack {
            NotesListView(searchText: searchText)
                .navigationTitle("Notes")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            isPresentingAdd = true
                        } label: {
                            Image(systemName: "plus.circle.fill")
                        }
                        .accessibilityLabel("Yeni Not Ekle")
                    }
                }
                .sheet(isPresented: $isPresentingAdd) {
                    AddEditNoteView()
                }
        }
        .searchable(text: $searchText, prompt: "Başlığa göre ara")
    }
}

#Preview {
    ContentView()
}
