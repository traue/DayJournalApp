import SwiftData
import SwiftUI

struct JournalEntriesListView: View {

    @Environment(\.modelContext) private var modelContext

    @Query(sort: \JournalEntry.date, order: .reverse) private
        var journalEntries: [JournalEntry]

    @State var showCreateView = false
    @State var searchText: String = ""

    var body: some View {

        NavigationStack {

            List(searchReults) { liestedJournalEntry in
                NavigationLink(
                    destination: EditJournalEntryView(
                        edititingJournalEntry: liestedJournalEntry
                    )
                ) {
                    JournalEntryRowView(rowJournalEntry: liestedJournalEntry)
                }
            }
            .navigationTitle(
                journalEntries.count == 0
                    ? "Nenhum registro"
                    : journalEntries.count == 1
                        ? "Um registro"
                        : "\(journalEntries.count) registros"
            )
            .toolbar {
                Button(action: {
                    showCreateView = true
                }) {
                    Label("Adicionar entrada de diário", systemImage: "plus")
                }
            }
            .sheet(isPresented: $showCreateView) {
                CreateJournalEntreyView()
            }
        }
        .searchable(text: $searchText)
    }

    var searchReults: [JournalEntry] {
        guard !searchText.isEmpty else {
            return journalEntries
        }

        return journalEntries.filter {
            $0.title.lowercased().contains(searchText.lowercased())
                || $0.text.contains(searchText.lowercased())
        }
    }
}

#Preview {
    JournalEntriesListView()
        .modelContainer(for: JournalEntry.self, inMemory: true)
}
