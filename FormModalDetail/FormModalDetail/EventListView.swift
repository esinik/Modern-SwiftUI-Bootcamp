//
//  EventListView.swift
//  FormModalDetail
//
//  Created by Ertan Şinik on 9.09.2025.
//

import SwiftUI

struct EventListView: View {
    @StateObject private var vm = EventViewModel()
    @State private var showAddSheet = false

    private var dateFormatter: DateFormatter {
        let df = DateFormatter()
        df.dateStyle = .medium
        df.timeStyle = .short
        return df
    }

    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.events) { event in
                    NavigationLink(value: event) {
                        HStack(spacing: 12) {
                            Text(event.type.rawValue.prefix(1))
                                .font(.headline)
                                .frame(width: 32, height: 32)
                                .background(Color(.systemGray5))
                                .clipShape(Circle())

                            VStack(alignment: .leading, spacing: 4) {
                                Text(event.title)
                                    .font(.headline)
                                Text("\(dateFormatter.string(from: event.date))\n\(event.type.rawValue)")
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                            }

                            Spacer()

                            // Hatırlatıcı durumu
                            Image(systemName: event.hasReminder ? "bell.fill" : "bell.slash")
                                .foregroundStyle(event.hasReminder ? .blue : .secondary)
                                .accessibilityLabel(event.hasReminder ? "Hatırlatıcı açık" : "Hatırlatıcı kapalı")
                                .onTapGesture {
                                    vm.toggleReminder(for: event)
                                }
                        }
                    }
                }
                .onDelete(perform: vm.delete)
            }
            .navigationTitle("Etkinlikler")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showAddSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    .accessibilityLabel("Yeni Etkinlik Ekle")
                }
                ToolbarItem(placement: .topBarLeading) { EditButton() }
            }
            .sheet(isPresented: $showAddSheet) {
                EventFormView { title, date, type, hasReminder in
                    vm.addEvent(title: title, date: date, type: type, hasReminder: hasReminder)
                }
            }
            .navigationDestination(for: Event.self) { event in
                EventDetailView(event: event, vm: vm)
            }
        }
    }
}

#Preview {
    EventListView()
}
