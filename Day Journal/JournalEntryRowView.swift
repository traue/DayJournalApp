import SwiftUI

struct JournalEntryRowView: View {

    let rowJournalEntry: JournalEntry

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(rowJournalEntry.title)
                    .bold()
                Text("-")
                Text(rowJournalEntry.text)
                    .lineLimit(1)
                    .foregroundStyle(.secondary)
            }
            .padding(.bottom, 1)

            HStack {
                Text(rowJournalEntry.date, style: .date)
                    .foregroundStyle(.secondary)

                Text(String(repeating: "⭐️", count: Int(rowJournalEntry.rating)))
            }
            .font(.caption)
        }

    }
}

#Preview {
    JournalEntryRowView(
        rowJournalEntry: JournalEntry(
            title: "A good day",
            text: "I had a good day at work",
            rating: 4,
            date: Date()
        )
    )
}
