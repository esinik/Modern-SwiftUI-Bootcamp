//
//  ContentView.swift
//  PokeDemoApp
//
//  Created by Ertan Şinik on 18.09.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = PokemonViewModel()

    var body: some View {
        NavigationStack {
            Group {
                switch vm.state {
                case .idle:
                    listView
                case .loading:
                    ProgressView("Yükleniyor…")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                case .failed(let message):
                    VStack(spacing: 12) {
                        Text("Bir hata oluştu")
                            .font(.headline)
                        Text(message)
                            .font(.footnote)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.secondary)
                        Button("Tekrar Dene") { Task { await vm.load(limit: 33) } }
                            .buttonStyle(.borderedProminent)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            .navigationTitle("Pokémon")
        }
        .task { await vm.load(limit: 33) }
        .searchable(text: $vm.searchText, prompt: "Bulbasaur, Pikachu…")
    }

    private var listView: some View {
        List(vm.filtered, id: \ .self) { item in
            NavigationLink(value: item) {
                PokemonRow(item: item)
            }
        }
        .navigationDestination(for: PokemonListItem.self) { item in
            PokemonDetailView(item: item)
        }
        .overlay {
            if vm.filtered.isEmpty {
                ContentUnavailableView("Sonuç bulunamadı",
                                        systemImage: "magnifyingglass",
                                        description: Text("Başka bir anahtar kelime deneyin."))
            }
        }
    }
}

struct PokemonRow: View {
    let item: PokemonListItem

    var body: some View {
        HStack(spacing: 12) {
            AsyncImage(url: item.imageURL) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .symbolRenderingMode(.hierarchical)
                @unknown default:
                    Color.clear
                }
            }
            .frame(width: 48, height: 48)

            Text(item.displayName)
                .font(.headline)
            Spacer()
            Text("#\(item.id)")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    ContentView()
}
