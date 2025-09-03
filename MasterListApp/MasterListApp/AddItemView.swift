//
//  AddItemView.swift
//  MasterListApp
//
//  Created by Ertan Şinik on 1.09.2025.
//

import SwiftUI

struct AddItemView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var baslik: String = ""
    @State private var aciklama: String = ""
    @State private var tamamlandi: Bool = false

    // Kayıt sonrası yapılacak işi üst görünüme bildirmek için callback
    var onSave: (_ baslik: String, _ aciklama: String, _ tamamlandi: Bool) -> Void

    var body: some View {
        NavigationStack {
            Form {
                Section("Bilgiler") {
                    TextField("Başlık", text: $baslik)
                    TextField("Açıklama", text: $aciklama)
                }

                Section {
                    Toggle("Tamamlandı olarak işaretle", isOn: $tamamlandi)
                }
            }
            .navigationTitle("Yeni Öğe")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Vazgeç") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Kaydet") {
                        // basit doğrulama
                        guard !baslik.trimmingCharacters(in: .whitespaces).isEmpty else { return }
                        onSave(baslik, aciklama, tamamlandi)
                        dismiss()
                    }
                    .disabled(baslik.trimmingCharacters(in: .whitespaces).isEmpty)
                }
            }
        }
    }
}

#Preview {
    AddItemView { _,_,_ in }
}
