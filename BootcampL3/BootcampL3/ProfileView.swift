//
//  ProfileView.swift
//  BootcampL3
//
//  Created by Ertan Şinik on 23.08.2025.
//

import SwiftUI

struct ProfileView: View {
    
    // Örnek veri
    let name = "Ertan Şinik"
    let tagline = "Senior Mobile Developer -> iOS/Android/Flutter"
    let about =
    """
    10+ yıllık deneyimle iOS, Android ve Flutter projelerinde çalışıyorum. Gerçek zamanlı iletişim, offline veri yönetimi ve yüksek performanslı arayüzler odak alanlarım. Temiz mimari, test edilebilirlik ve sürdürülebilir kod önceliklerimdir.
    """
    let stats: [(title: String, value: String, systemIcon: String)] = [
        ("Takipçi", "123", "person.2.fill"),
        ("Takip",   "431", "person.crop.circle.badge.checkmark"),
        ("Beğeni",  "111", "heart.fill")
    ]

    var body: some View {
        VStack(spacing: 16) {

            // ÜST BÖLÜM (HEADER)
            ZStack {
                LinearGradient(
                    colors: [.green, .blue],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )

                VStack(spacing: 10) {
                    Image("profile")
                        .frame(width: 110, height: 110)
                        .overlay(
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .foregroundStyle(.white.opacity(0.9))
                                .frame(width: 110, height: 110)
                        )

                    Text(name)
                        .font(.title2.weight(.semibold))
                        .foregroundStyle(.white)

                    Text(tagline)
                        .font(.subheadline)
                        .foregroundStyle(.white)
                }
            }
            .frame(height: 280)
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .padding(.horizontal)

            // BİLGİ KARTLARI (HStack)
            HStack(spacing: 12) {
                ForEach(stats, id: \.title) { item in
                    StatCard(value: item.value, title: item.title, systemIcon: item.systemIcon)
                        .frame(maxWidth: 200)
                }
            }
            .padding(.horizontal)

            // HAKKIMDA
            VStack(alignment: .leading, spacing: 8) {
                Text("Hakkımda")
                    .font(.headline.bold())
                ScrollView {
                    Text(about)
                        .font(.body)
                        .foregroundStyle(.secondary)
                        .fixedSize(horizontal: false, vertical: true)

                }
                .frame(maxHeight: 100)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(.background)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.quaternary, lineWidth: 1)
                    )
            )
            .padding(.horizontal)
            Spacer()
            
            // BUTONLAR
            HStack(spacing: 12) {
                Button {
                    // Mesaj gönder aksiyonu
                } label: {
                    Label("Mesaj Gönder", systemImage: "paperplane.fill")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)

                Button {
                    // Takip et aksiyonu
                } label: {
                    Label("Takip Et", systemImage: "plus.circle.fill")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
            }
            .padding([.trailing, .bottom, .leading], 20)
        }
        .padding(.top, 8)
        .background(Color(.systemGroupedBackground))
    }
}


#Preview {
    ProfileView()
}
