//
//  Untitled.swift
//  FormModalDetail
//
//  Created by Ertan Şinik on 9.09.2025.
//

import SwiftUI

struct EventFormView: View {
    @Environment(\.dismiss) private var dismiss

    @State private var title: String = ""
    @State private var date: Date = .now
    @State private var type: EventType = .other
    @State private var hasReminder: Bool = false

    let onSave: (_ title: String, _ date: Date, _ type: EventType, _ hasReminder: Bool) -> Void

    var body: some View {
        NavigationStack {
            Form {
                Section("Etkinlik Bilgileri") {
                    TextField("Etkinlik adı", text: $title)
                    DatePicker("Tarih", selection: $date, displayedComponents: [.date, .hourAndMinute])

                    Picker("Tür", selection: $type) {
                        ForEach(EventType.allCases) { t in
                            Text(t.rawValue).tag(t)
                        }
                    }

                    Toggle("Hatırlatıcı", isOn: $hasReminder)
                }
            }
            .navigationTitle("Yeni Etkinlik")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Vazgeç") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Kaydet") {
                        guard !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
                        onSave(title, date, type, hasReminder)
                        dismiss()
                    }
                    .disabled(title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
            }
        }
    }
}

#Preview {
    EventFormView { _,_,_,_ in }
}
