import SwiftData
import SwiftUI

@main
struct Day_JournalApp: App {

    var sharedModelContainer: ModelContainer = {

        let schema = Schema([
            JournalEntry.self
        ])

        let modelConfiguration = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: false
        )

        do {
            return try ModelContainer(
                for: schema,
                configurations: [modelConfiguration]
            )
        } catch {
            fatalError("Impossível criar o ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            JournalEntriesListView()
        }
        .modelContainer(sharedModelContainer)
    }
}
