//
//  EventDetailView.swift
//  FormModalDetail
//
//  Created by Ertan Şinik on 9.09.2025.
//

import SwiftUI

struct EventDetailView: View {
    let event: Event
    @ObservedObject var vm: EventViewModel
    @Environment(\.dismiss) private var dismiss

    @State private var title: String
    @State private var date: Date
    @State private var type: EventType
    @State private var hasReminder: Bool

    init(event: Event, vm: EventViewModel) {
        self.event = event
        self.vm = vm
        _title = State(initialValue: event.title)
        _date = State(initialValue: event.date)
        _type = State(initialValue: event.type)
        _hasReminder = State(initialValue: event.hasReminder)
    }

    var body: some View {
        Form {
            Section("Etkinlik") {
                TextField("Etkinlik adı", text: $title)
                DatePicker("Tarih", selection: $date, displayedComponents: [.date, .hourAndMinute])
                Picker("Tür", selection: $type) {
                    ForEach(EventType.allCases) { t in
                        Text(t.rawValue).tag(t)
                    }
                }
                Toggle("Hatırlatıcı", isOn: $hasReminder)
                    .onChange(of: hasReminder) { oldValue, newValue in
                        vm.update(event, hasReminder: newValue)
                    }
            }

            Section {
                Button(role: .destructive) {
                    vm.delete(event)
                    dismiss()
                } label: {
                    Label("Sil", systemImage: "trash")
                }
            }
        }
        .navigationTitle("Detay")
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Kaydet") {
                    vm.update(event,
                              title: title,
                              date: date,
                              type: type,
                              hasReminder: hasReminder)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    let vm = EventViewModel()
    return NavigationStack {
        if let e = vm.events.first {
            EventDetailView(event: e, vm: vm)
        }
    }
}
