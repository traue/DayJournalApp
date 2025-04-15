import SwiftUI

struct EditJournalEntryView: View {

    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss

    @State var edititingJournalEntry: JournalEntry
    @State var editMode = false
    @State private var showDeleteConfirmation = false

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
                    showDeleteConfirmation = true
                }
                .bold()
                .foregroundColor(.red)

                .confirmationDialog(
                    "Deletar mesmo?",
                    isPresented: $showDeleteConfirmation,
                    titleVisibility: .visible
                ) {
                    Button("Deletar", role: .destructive) {
                        modelContext.delete(edititingJournalEntry)
                        dismiss()
                    }
                    Button("Cancelar", role: .cancel) {}
                }

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
