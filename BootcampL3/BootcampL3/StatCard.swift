//
//  Untitled.swift
//  BootcampL3
//
//  Created by Ertan Şinik on 23.08.2025.
//

import SwiftUI

// Küçük bilgi kartı bileşeni
struct StatCard: View {
    let value: String
    let title: String
    let systemIcon: String

    var body: some View {
        VStack(spacing: 6) {
            Image(systemName: systemIcon)
                .font(.title3)
                .foregroundStyle(.secondary)

            Text(value)
                .font(.title3.weight(.semibold))

            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding(.vertical, 14)
        .frame(minHeight: 88)
        .frame(maxWidth: 200)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(.background)
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(.quaternary, lineWidth: 1)
                )
                .shadow(radius: 0.5, y: 0.5)
        )
    }
}
