//
//  Models.swift
//  PokeDemoApp
//
//  Created by Ertan Şinik on 18.09.2025.
//

import Foundation

// PokeAPI list response
struct PokemonListResponse: Codable {
    let results: [PokemonListItem]
}

struct PokemonListItem: Codable, Identifiable, Hashable {
    let name: String
    let url: String

    var id: Int {
        // son path component'ten Int çekiyoruz.
        if let last = URL(string: url)?.pathComponents.last(where: { !$0.isEmpty }),
           let intVal = Int(last) {
            return intVal
        }
        
        // Bazı linklerin sonunda / geliyor. Onları temizlemek için
        if let comps = URL(string: url)?.pathComponents,
           comps.count >= 2,
           let intVal = Int(comps[comps.count - 2]) {
            return intVal
        }
        return UUID().hashValue // fallback
    }

    // Üstte aldığımız id ile imageUrl üretiyoruz
    var imageURL: URL? {
        URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png")
    }

    var displayName: String { name.capitalized }
}
