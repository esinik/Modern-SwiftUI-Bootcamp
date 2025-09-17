//
//  NoteRow.swift
//  NotesAppWithCoreData
//
//  Created by Ertan Şinik on 16.09.2025.
//

import SwiftUI

struct NoteRow: View {
    let note: NoteEntity

    private var dateString: String {
        guard let date = note.date else { return "-" }
        let df = DateFormatter()
        df.locale = Locale(identifier: "tr_TR")
        df.dateStyle = .medium
        df.timeStyle = .short
        return df.string(from: date)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(note.title ?? "Başlıksız")
                .font(.headline)
                .lineLimit(1)

            HStack(spacing: 8) {
                Image(systemName: "calendar")
                    .imageScale(.small)
                Text(dateString)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                Spacer()
            }
        }
        .padding(.vertical, 6)
    }
}
