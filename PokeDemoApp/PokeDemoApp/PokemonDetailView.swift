//
//  PokemonDetailView.swift
//  PokeDemoApp
//
//  Created by Ertan Şinik on 18.09.2025.
//

import SwiftUI

struct PokemonDetailView: View {
    let item: PokemonListItem

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                AsyncImage(url: item.imageURL) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(height: 200)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 300)
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 200)
                            .symbolRenderingMode(.hierarchical)
                    @unknown default:
                        EmptyView()
                    }
                }

                Text(item.displayName)
                    .font(.largeTitle.bold())
                Text("ID: #\(item.id)")
                    .foregroundStyle(.secondary)
            }
            .padding()
        }
        .navigationTitle(item.displayName)
        .navigationBarTitleDisplayMode(.inline)
    }
}
