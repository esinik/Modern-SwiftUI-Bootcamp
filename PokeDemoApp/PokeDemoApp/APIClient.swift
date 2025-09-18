//
//  ApiClient.swift
//  PokeDemoApp
//
//  Created by Ertan Şinik on 18.09.2025.
//

import Foundation

enum APIError: LocalizedError {
    case badURL
    case invalidResponse
    case decodingFailed

    var errorDescription: String? {
        switch self {
        case .badURL: return "Geçersiz URL."
        case .invalidResponse: return "Sunucudan geçersiz yanıt alındı."
        case .decodingFailed: return "Veri çözümlenirken (decode) hata oluştu."
        }
    }
}

struct APIClient {
    static let shared = APIClient()
    private init() {}

    func fetchPokemonList(limit: Int = 50) async throws -> [PokemonListItem] {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=\(limit)") else {
            throw APIError.badURL
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let http = response as? HTTPURLResponse, 200..<300 ~= http.statusCode else {
            throw APIError.invalidResponse
        }
        do {
            let decoded = try JSONDecoder().decode(PokemonListResponse.self, from: data)
            return decoded.results
        } catch {
            throw APIError.decodingFailed
        }
    }
}
