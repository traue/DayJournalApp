import SwiftUI

struct EditJournalEntryView: View {

    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss

    @State var edititingJournalEntry: JournalEntry
    @State var editMode = true

    var body: some View {

        if editMode {
            Form {
                TextField("Título", text: $edititingJournalEntry.title)
                    .bold()

                DatePicker(
                    "Data",
                    selection: $edititingJournalEntry.date,
                    displayedComponents: .date
                )

                Text(
                    String(
                        repeating: "⭐️",
                        count: Int(edititingJournalEntry.rating)
                    )
                )

                Slider(value: $edititingJournalEntry.rating, in: 1...5, step: 1)

                TextEditor(text: $edititingJournalEntry.text)
            }
            .navigationTitle("Editando")
            .toolbar {
                Button("Deletar") {
                    modelContext.delete(edititingJournalEntry)
                    dismiss()
                }
                .bold()
                .foregroundColor(.red)

                Button("Salvar") {
                    editMode = false
                }
                .bold()
            }
        } else {
            JournalEntreyDetailView(detailJournalEntry: edititingJournalEntry)
                .toolbar {
                    Button("Editar") {
                        editMode = true
                    }
                    .bold()
                }
        }

    }
}

#Preview {
    NavigationStack {
        EditJournalEntryView(
            edititingJournalEntry: JournalEntry(
                title: "This is just a test",
                text: "Dont worry about this",
                rating: 5.0,
                date: Date()
            )
        )
    }
}
