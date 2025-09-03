//
//  ContentView.swift
//  MasterListApp
//
//  Beginner-friendly single-file version without ViewModels
//


import SwiftUI

struct ListItem: Identifiable {
    let id = UUID()
    var baslik: String
    var aciklama: String
    var tamamlandi: Bool
}

// Başlangıç verisi
let baslangicVerisi: [ListItem] = [
    .init(baslik: "Öğe 1",  aciklama: "Açıklama 1",  tamamlandi: false),
    .init(baslik: "Öğe 2",  aciklama: "Açıklama 2",  tamamlandi: false),
    .init(baslik: "Öğe 3",  aciklama: "Açıklama 3",  tamamlandi: false),
    .init(baslik: "Öğe 4",  aciklama: "Açıklama 4",  tamamlandi: false),
    .init(baslik: "Öğe 5",  aciklama: "Açıklama 5",  tamamlandi: false),
    .init(baslik: "Öğe 6",  aciklama: "Açıklama 6",  tamamlandi: false),
    .init(baslik: "Öğe 7",  aciklama: "Açıklama 7",  tamamlandi: true),
    .init(baslik: "Öğe 8",  aciklama: "Açıklama 8",  tamamlandi: true),
    .init(baslik: "Öğe 9",  aciklama: "Açıklama 9",  tamamlandi: true),
    .init(baslik: "Öğe 10", aciklama: "Açıklama 10", tamamlandi: true)
]

struct ContentView: View {
    // Veri & UI state
    @State private var items: [ListItem] = baslangicVerisi
    @State private var showAddSheet = false
    @State private var themeColor: Color = .blue
    @State private var viewMode: ViewMode = .list

    enum ViewMode: String, CaseIterable, Identifiable {
        case list = "List"
        case lazy = "LazyVStack"
        var id: String { rawValue }
    }

    // Bölüm filtreleri
    private var tamamlanacaklar: [ListItem] { items.filter { !$0.tamamlandi } }
    private var tamamlananlar: [ListItem]   { items.filter {  $0.tamamlandi } }

    var body: some View {
        NavigationStack {
            Group {
                if viewMode == .list {
                    listView
                        .onAppear { rastgeleTemaSec() }
                } else {
                    lazyAltGorunum // Alternatif görünüm
                        .onAppear { rastgeleTemaSec() }
                }
            }
            .navigationTitle("Başlangıç Listesi")
            .tint(themeColor)
            .background(
                LinearGradient(
                    colors: [themeColor.opacity(0.18), .clear],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
            )
            .toolbar {
                // Görünüm seçici
                ToolbarItem(placement: .topBarLeading) {
                    Picker("Görünüm", selection: $viewMode) {
                        ForEach(ViewMode.allCases) { mode in
                            Text(mode.rawValue).tag(mode)
                        }
                    }
                    .pickerStyle(.segmented)
                    .frame(maxWidth: 240)
                }
                // Yeni öğe ekle
                ToolbarItem(placement: .topBarTrailing) {
                    Button { showAddSheet = true } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                    .accessibilityLabel("Yeni Öğe Ekle")
                }
                // Temayı yeniden karıştır (opsiyonel)
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        rastgeleTemaSec()
                    } label: {
                        Image(systemName: "sparkles")
                    }
                    .accessibilityLabel("Temayı Karıştır")
                }
            }
            .sheet(isPresented: $showAddSheet) {
                AddItemView { baslik, aciklama, tamamlandi in
                    items.append(.init(baslik: baslik, aciklama: aciklama, tamamlandi: tamamlandi))
                }
            }
        }
    }

    // MARK: - LIST görünümü (swipe ile silme)
    private var listView: some View {
        List {
            Section("Tamamlanacaklar") {
                ForEach(tamamlanacaklar) { item in
                    NavigationLink {
                        DetailView(item: item)
                    } label: {
                        SatirView(item: item)
                    }
                }
                .onDelete(perform: silTamamlanacaklardan)
            }

            Section("Tamamlananlar") {
                ForEach(tamamlananlar) { item in
                    NavigationLink {
                        DetailView(item: item)
                    } label: {
                        SatirView(item: item, completedStyle: true)
                    }
                }
                .onDelete(perform: silTamamlananlardan)
            }
        }
    }

    // MARK: - LazyVStack/ScrollView alternatif görünüm
    private var lazyAltGorunum: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Tamamlanacaklar")
                    .font(.title2).bold()
                    .padding(.horizontal)

                LazyVStack(spacing: 8, pinnedViews: []) {
                    ForEach(tamamlanacaklar) { item in
                        NavigationLink {
                            DetailView(item: item)
                        } label: {
                            KartView(item: item) // kart stili
                        }
                        .buttonStyle(.plain)
                        .padding(.horizontal)
                    }
                }

                Divider().padding(.vertical, 8)

                Text("Tamamlananlar")
                    .font(.title2).bold()
                    .padding(.horizontal)

                LazyVStack(spacing: 8) {
                    ForEach(tamamlananlar) { item in
                        NavigationLink {
                            DetailView(item: item)
                        } label: {
                            KartView(item: item, completedStyle: true)
                        }
                        .buttonStyle(.plain)
                        .padding(.horizontal)
                    }
                }
            }
            .padding(.vertical)
        }
    }

    // MARK: - Silme yardımcıları
    private func silTamamlanacaklardan(at offsets: IndexSet) {
        // offsets: tamamlanacaklar altkümesindeki indeksler
        let silinecekIdler = offsets.map { tamamlanacaklar[$0].id }
        items.removeAll { silinecekIdler.contains($0.id) }
    }

    private func silTamamlananlardan(at offsets: IndexSet) {
        let silinecekIdler = offsets.map { tamamlananlar[$0].id }
        items.removeAll { silinecekIdler.contains($0.id) }
    }

    // MARK: - Tema
    private func rastgeleTemaSec() {
        
        let renkler: [Color] = [
                .red, .orange, .yellow, .green, .mint,
                .teal, .cyan, .blue, .indigo, .purple,
                .pink, .brown, .gray
            ]

        themeColor = renkler.randomElement() ?? .blue
    }
}

// MARK: - Satır & Kart görünümleri
struct SatirView: View {
    let item: ListItem
    var completedStyle: Bool = false

    var body: some View {
        HStack(spacing: 12) {
            if completedStyle {
                Image(systemName: "checkmark.circle")
                    .imageScale(.large)
            }
            else {
                Image(systemName: "circle")
                    .imageScale(.large)
            }
            VStack(alignment: .leading, spacing: 4) {
                Text(item.baslik).font(.headline)
                Text(item.aciklama).font(.subheadline).foregroundStyle(.secondary)
            }
        }
        .padding(.vertical, 4)
        .opacity(completedStyle ? 0.7 : 1.0)
    }
}

struct KartView: View {
    let item: ListItem
    var completedStyle: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text(item.baslik)
                    .font(.headline)
                Spacer()
                if completedStyle {
                    Image(systemName: "checkmark.circle.fill")
                }
            }
            Text(item.aciklama)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .padding(12)
        .background(.ultraThinMaterial)
        .overlay(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .stroke(.quaternary, lineWidth: 1)
        )
    }
}

#Preview { ContentView() }
