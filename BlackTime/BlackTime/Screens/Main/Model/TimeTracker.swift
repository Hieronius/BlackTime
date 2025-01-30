import Foundation

// MARK: TODO - Refactor accordingly to dependency injection
/// Model for managing time categories and remaining hours
final class TimeTracker {

	var categories: [TimeCategory] = [
		TimeCategory(name: "Cleaning", color: .systemBlue, hours: 1),
		TimeCategory(name: "Working", color: .systemGreen, hours: 2),
		TimeCategory(name: "SelfDevelopment", color: .systemOrange, hours: 3),
		TimeCategory(name: "Cooking", color: .systemYellow, hours: 4),
		TimeCategory(name: "Other", color: .systemRed, hours: 5),
		TimeCategory(name: "Resting", color: .systemBrown, hours: 6)
	]

	var remainingHours: Double {
		24 - categories.reduce(0) { $0 + $1.hours }
	}

	func addHours(_ hours: Double, to category: String) {
		guard let index = categories.firstIndex(where: { $0.name == category }) else { return }
		categories[index].hours += hours
	}
}
