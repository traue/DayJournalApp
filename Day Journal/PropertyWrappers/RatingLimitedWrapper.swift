import Foundation

@propertyWrapper
struct RatingLimited {
    private var value: Double
    private let range: ClosedRange<Double>

    var wrappedValue: Double {
        get { value }
        set { value = min(max(range.lowerBound, newValue), range.upperBound) }
    }

    init(wrappedValue initialValue: Double, range: ClosedRange<Double> = 1...5) {
        self.range = range
        self.value = min(max(range.lowerBound, initialValue), range.upperBound)
    }
}
