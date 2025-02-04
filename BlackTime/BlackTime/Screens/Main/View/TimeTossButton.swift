import UIKit
import SnapKit

/// Custom Button to implement drag&drop mechanics for time spending, managing time categories and other
final class TimeTossButton: UIButton {

	// MARK: - Properties

	/// A menu of time spending categories becomes visible when you drag `TimeTossButton`
	let radialMenu = RadialMenuView()

	/// An options list to choose time interval for a new time spending operation. Becomes visible when you tap `TimeTossButton`
	let optionsList = OptionsListView()

	/// List of time spending categories can be seen on the screen
	var isCategoriesVisible = false

	/// 1/5/10/30/... minutes time interval options can be seen on the screen
	var isTimeOptionsVisible = false

	/// Property to track when user dragged the "coin"
	var isDragging = false
	

	// MARK: - Initialization

	override init(frame: CGRect) {
		super.init(frame: frame)

		embedViews()
		setupLayout()
		setupAppearance()
		setupData()
		setupBehaviour()

	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - Private Methods

// MARK: - Embed Views

private extension TimeTossButton {

	func embedViews() {

		addSubview(radialMenu)
		addSubview(optionsList)
	}
}

// MARK: - Setup Layout

private extension TimeTossButton {

	func setupLayout() {

		snp.makeConstraints { make in
			make.height.equalTo(50)
			make.width.equalTo(50)
		}


	}
}

// MARK: - Setup Appearance

private extension TimeTossButton {

	func setupAppearance() {

		setTitleColor(AppColors.primaryColor, for: .normal)
		backgroundColor = AppColors.actionColor
		layer.cornerRadius = 25
		clipsToBounds = true

	}
}

// MARK: - Setup Data

private extension TimeTossButton {

	func setupData() {
		setTitle("+", for: .normal)
	}
}

// MARK: - Setup Behaviour

private extension TimeTossButton {

	func setupBehaviour() {

		radialMenu.isHidden = true
		optionsList.isHidden = true

		addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

		addTarget(self, action: #selector(buttonDragged), for: .touchDragInside)


	}

	@objc func buttonTapped() {

		if isDragging {
			// Implement the check if the button is in radial menu borders
			isDragging = false
			print("dropped the coin")

		} else {

			if optionsList.isHidden {
				optionsList.isHidden = false
				print("optionsList is visible")
			} else {
				optionsList.isHidden = true
				print("optionsList is hidden")
			}
		}
	}

	@objc func buttonDragged() {
		isDragging = true

		if isDragging {
			radialMenu.isHidden = false
			print("radial menu is visible")
		} else {
			radialMenu.isHidden = true
			print("radial menu is hidden")
		}
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
