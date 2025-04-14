import Foundation
import SwiftData

@Model
final class JournalEntry: Identifiable {
    
    var title: String = ""
    var text: String = ""
    var rating: Double = 0.0
    var date: Date = Date()
    
    init(title: String, text: String, rating: Double, date: Date) {
        self.title = title
        self.text = text
        self.rating = rating
        self.date = date
        
    }
}
