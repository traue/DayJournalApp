import SwiftUI

struct CreateJournalEntreyView: View {

    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss

    @State @Trimmed var title: String = ""
    @State var text: String = ""
    @State @RatingLimited var rating: Double = 4.0
    @State var date: Date = Date()

    var body: some View {
        NavigationStack {

            Form {
                TextField("Título", text: Binding(
                    get: { title },
                    set: { title = $0 }
                ))
                    .bold()

                DatePicker(
                    "Data",
                    selection: $date,
                    displayedComponents: .date
                )

                Text(String(repeating: "⭐️", count: Int(rating)))

                Slider(
                    value: Binding(
                        get: { rating },
                        set: { rating = $0 }
                    ),
                    in: 1...5, //testar com 6 na aula
                    step: 1
                )
                
                TextEditor(text: Binding(
                    get: { text },
                    set: { text = $0 }
                ))
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
