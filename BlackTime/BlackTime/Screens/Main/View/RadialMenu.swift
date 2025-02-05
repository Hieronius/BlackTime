import UIKit
import SnapKit

/// Custom class to implement a Radial Menu when you drag the "+" button
final class RadialMenuView: UIView {

	// MARK: - Properties

	var categoryViews: [UIView] = []
	let radius: CGFloat = 100
	let arcAngle: CGFloat = .pi / 2 // 90 degrees

	// MARK: - Initialization

	init(categories: [TimeCategory]) {
			super.init(frame: .zero)
			setupMenu(categories: categories)
			isHidden = false
		}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - Public Methods

extension RadialMenuView {
	func show() {
		self.isHidden = false
		UIView.animate(withDuration: 0.3) {
			self.alpha = 1
		}
	}

	func hide() {
		UIView.animate(withDuration: 0.3, animations: {
			self.alpha = 0
		}) { _ in
			self.isHidden = true
		}
	}
}

extension RadialMenuView {

	func setupMenu(categories: [TimeCategory]) {
		for category in categories {
			let label = UILabel()
			label.text = category.name
			label.backgroundColor = category.color
			label.layer.cornerRadius = 25
			label.clipsToBounds = true
			categoryViews.append(label)
			addSubview(label)
		}
		layoutButtons(center: center)
	}

	func layoutButtons(center: CGPoint) {
		let angleIncrement = arcAngle / CGFloat(categoryViews.count - 1)
		for (index, label) in categoryViews.enumerated() {
			let angle = -arcAngle / 2 + angleIncrement * CGFloat(index)
			let x = center.x + radius * cos(angle)
			let y = center.y + radius * sin(angle)
			label.frame = CGRect(x: x, y: y, width: 50, height: 50)
		}
	}
}
