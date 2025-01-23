import Foundation

/// Model for managing time categories and remaining hours
final class TimeTracker {
	var categories: [TimeCategory] = [
		TimeCategory(name: "Cleaning", color: .systemBlue, hours: 0),
		TimeCategory(name: "Working", color: .systemGreen, hours: 0),
		TimeCategory(name: "Resting", color: .systemOrange, hours: 0)
	]

	var remainingHours: Double {
		24 - categories.reduce(0) { $0 + $1.hours }
	}

	func addHours(_ hours: Double, to category: String) {
		guard let index = categories.firstIndex(where: { $0.name == category }) else { return }
		categories[index].hours += hours
	}
}
