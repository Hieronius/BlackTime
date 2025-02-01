import UIKit
import SnapKit

/// Custom Button to implement drag&drop mechanics for time spending, managing time categories and other
final class TimeTossButton: UIButton {

	// MARK: - Properties

	/// List of time spending categories can be seen on the screen
	var isCategoriesVisible = false

	/// 1/5/10/30/... minutes time interval options can be seen on the screen
	var isTimeOptionsVisible = false

	/// Property to track when user dragged the "coin"
	var isDragging = false

	let radialMenuView = UIView()
	

	// MARK: - Initialization

	override init(frame: CGRect) {
		super.init(frame: frame)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - Private Methods

// MARK: - Embed Views

private extension MainRootView {

	func embedViews() {

	}
}

// MARK: - Setup Layout

private extension MainRootView {

	func setupLayout() {

	}
}

// MARK: - Setup Appearance

private extension MainRootView {

	func setupAppearance() {

	}
}

// MARK: - Setup Data

private extension MainRootView {

	func setupData() {

	}
}

// MARK: - Setup Behaviour

private extension MainRootView {

	func setupBehaviour() {

	}
}



/*
import UIKit

class CustomButton: UIButton {
	var optionsView: UIView!
	var isOptionsVisible = false

	override init(frame: CGRect) {
		super.init(frame: frame)
		setupButton()
	}

	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setupButton()
	}

	private func setupButton() {
		// Configure button appearance
		self.backgroundColor = .systemBlue
		self.layer.cornerRadius = 25
		self.setTitle("+", for: .normal)
		self.titleLabel?.font = UIFont.systemFont(ofSize: 24)

		// Add tap action
		self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

		// Setup options view
		optionsView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
		optionsView.backgroundColor = .lightGray
		optionsView.layer.cornerRadius = 10
		optionsView.isHidden = true
		self.addSubview(optionsView)

		// Add pan gesture for drag and drop
		let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
		self.addGestureRecognizer(panGesture)

		// Add long press gesture
		let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
		self.addGestureRecognizer(longPressGesture)
	}

	@objc private func buttonTapped() {
		isOptionsVisible.toggle()
		UIView.animate(withDuration: 0.3) {
			self.optionsView.isHidden = !self.isOptionsVisible
		}
	}

	@objc private func handlePan(gesture: UIPanGestureRecognizer) {
		let translation = gesture.translation(in: self)
		self.center = CGPoint(x: self.center.x + translation.x, y: self.center.y + translation.y)
		gesture.setTranslation(.zero, in: self)

		// Implement hit testing and category selection logic here
	}

	@objc private func handleLongPress(gesture: UILongPressGestureRecognizer) {
		if gesture.state == .began {
			// Switch mode or time duration
			print("Long press detected")
		}
	}
}
 */
