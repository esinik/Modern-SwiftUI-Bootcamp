//
//  EventViewModel.swift
//  FormModalDetail
//
//  Created by Ertan Şinik on 9.09.2025.
//

import Foundation
import Combine

extension Date {
    static func from(year: Int, month: Int, day: Int, hour: Int, minute: Int) -> Date?
    {
        let gregorianCalendar = Calendar(identifier: .gregorian)
        let dateComponents = DateComponents(calendar: gregorianCalendar, year: year, month: month, day: day, hour: hour, minute: minute)
        return gregorianCalendar.date(from: dateComponents)
    }
}


final class EventViewModel: ObservableObject {
    @Published private(set) var events: [Event] = []

    init() {
        events = [
            Event(title: "Babamın Doğum Günü", date: Date.from(year: 2025, month: 11, day: 3, hour: 9, minute: 5)!, type: .birthday, hasReminder: true),
            Event(title: "Hoşgeldin Sonbahar", date: Date.from(year: 2025, month: 9, day: 21, hour: 10, minute: 30)!, type: .meeting, hasReminder: false),
            Event(title: "Yürüyüş", date: Date.from(year: 2025, month: 9, day: 13, hour: 13, minute: 0)!, type: .sport, hasReminder: true)
        ].sorted(by: { $0.date < $1.date })
    }

    func addEvent(title: String, date: Date, type: EventType, hasReminder: Bool) {
        let new = Event(title: title, date: date, type: type, hasReminder: hasReminder)
        events.append(new)
        sortEvents()
    }

    func delete(at offsets: IndexSet) {
        events.remove(atOffsets: offsets)
    }

    func delete(_ event: Event) {
        events.removeAll { $0.id == event.id }
    }

    func update(_ event: Event, title: String? = nil, date: Date? = nil, type: EventType? = nil, hasReminder: Bool? = nil) {
        guard let idx = events.firstIndex(where: { $0.id == event.id }) else { return }
        var tmpEvent = events[idx]
        if let title { tmpEvent.title = title }
        if let date  { tmpEvent.date = date }
        if let type  { tmpEvent.type = type }
        if let hasReminder { tmpEvent.hasReminder = hasReminder }
        events[idx] = tmpEvent
        sortEvents()
    }

    func toggleReminder(for event: Event) {
        update(event, hasReminder: !event.hasReminder)
    }

    private func sortEvents() {
        events.sort { $0.date < $1.date }
    }
}
