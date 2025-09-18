//
//  PokemonViewModel.swift
//  PokeDemoApp
//
//  Created by Ertan Şinik on 18.09.2025.
//

import Foundation

@MainActor
final class PokemonViewModel: ObservableObject {
    enum LoadState {
        case idle
        case loading
        case failed(String)
    }

    @Published var state: LoadState = .idle
    @Published private(set) var allPokemon: [PokemonListItem] = []
    @Published var searchText: String = ""

    var filtered: [PokemonListItem] {
        let q = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !q.isEmpty else { return allPokemon }
        return allPokemon.filter { $0.name.localizedCaseInsensitiveContains(q) }
    }

    func load(limit: Int = 50) async {
        state = .loading
        do {
            let items = try await APIClient.shared.fetchPokemonList(limit: limit)
            self.allPokemon = items
            self.state = .idle
        } catch {
            self.state = .failed(error.localizedDescription)
        }
    }
}
