//
//  NoteRow.swift
//  NotesAppWithUserDefault
//
//  Created by Ertan Şinik on 15.09.2025.
//

import SwiftUI

struct NoteRow: View {
    let note: Note
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(alignment: .firstTextBaseline) {
                Text(note.title)
                    .font(.headline)
                    .lineLimit(1)
                Spacer()
                Text(note.date.formatted(.dateTime.day().month().year().hour().minute()))
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            Text(note.content)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .lineLimit(2)
        }
        .padding(.vertical, 4)
    }
}
