//
//  DetailView.swift
//  MasterListApp
//
//  Created by Ertan Şinik on 1.09.2025.
//

import SwiftUI

struct DetailView: View {
    let item: ListItem

    // Rastgele seçeceğimiz SF Symbol isimleri
    private let semboller = [
        "star", "heart", "bolt", "flame", "leaf",
        "paperplane", "moon", "sun.max", "cloud", "pencil",
        "bookmark", "cart", "gift", "bell", "tortoise",
        "hare", "globe", "car", "bicycle", "airplane"
    ]

    @State private var sembolAdi: String

    init(item: ListItem) {
        self.item = item
        // Görünüm oluşturulurken bir kere rastgele seçelim
        _sembolAdi = State(initialValue: semboller.randomElement() ?? "star")
    }

    var body: some View {
        VStack(spacing: 16) {
            Text(item.baslik)
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)

            Text(item.aciklama)
                .font(.body)
                .foregroundStyle(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)

            Spacer().frame(height: 12)

            Image(systemName: sembolAdi)
                .font(.system(size: 72, weight: .regular))
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.quaternary, lineWidth: 1)
                )

            Spacer()

            // (Opsiyonel) İstersen dokununca yeni sembol seçsin
            Button("Rastgele başka sembol seç") {
                sembolAdi = semboller.randomElement() ?? "star"
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .navigationTitle("Detay")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DetailView(item: .init(baslik: "Örnek Başlık", aciklama: "Örnek açıklama metni.", tamamlandi: false))
}
