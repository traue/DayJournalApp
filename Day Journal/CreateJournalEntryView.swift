import SwiftUI

struct CreateJournalEntreyView: View {

    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss

    @State var title: String = ""
    @State var text: String = ""
    @State var rating: Double = 4.0
    @State var date: Date = Date()

    var body: some View {
        NavigationStack {

            Form {
                TextField("Título", text: $title)
                    .bold()

                DatePicker(
                    "Data",
                    selection: $date,
                    displayedComponents: .date
                )

                Text(String(repeating: "⭐️", count: Int(rating)))

                Slider(value: $rating, in: 1...5, step: 1)

                TextEditor(text: $text)
            }
            .navigationTitle(
                title == "" ? Text("Nova entrada no diário") : Text(title)
            )
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancelar") {
                        dismiss()
                    }
                    .foregroundColor(.red)

                }
                ToolbarItem(placement: .navigationBarTrailing) {

                    Button("Salvar") {
                        let newJournalEntry = JournalEntry(
                            title: title,
                            text: text,
                            rating: rating,
                            date: date
                        )
                        modelContext.insert(newJournalEntry)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    CreateJournalEntreyView()
}
