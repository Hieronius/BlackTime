import UIKit
import SnapKit

/// Custom Button to implement drag&drop mechanics for time spending, managing time categories and other
final class TimeTossButton: UIButton {

	// MARK: - Properties

	/// Original position of the `TossButton`
	var originalPosition: CGPoint = .zero

	/// An options list to choose time interval for a new time spending operation. Becomes visible when you tap `TimeTossButton`
	let optionsList = OptionsListView()

	/// List of time spending categories can be seen on the screen
	var isCategoriesVisible = false

	/// 1/5/10/30/... minutes time interval options can be seen on the screen
	var isTimeOptionsVisible = false

	/// Property to track when user dragged the "coin"
	var isDragging = false

	/// A menu of time spending categories becomes visible when you drag `TimeTossButton`
	// var radialMenu: RadialMenuView?

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

	// MARK: - Life Cycle

	override func didMoveToSuperview() {
		super.didMoveToSuperview()
		if let superview = superview {
			originalPosition = center  // Capture initial position
		}
	}

	// MARK: - Hit Test

	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
		super.touchesEnded(touches, with: event)
		print("touches ended")
		isDragging = false
	}

	override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
		super.touchesCancelled(touches, with: event)
		print("touches canceled")
		isDragging = false
	}
}

// MARK: - Private Methods

// MARK: - Embed Views

private extension TimeTossButton {

	func embedViews() {

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

		optionsList.isHidden = true

		addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

		addTarget(self, action: #selector(buttonDragged), for: .touchDragInside)

		// In TimeTossButton's setupBehaviour()
		let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
		addGestureRecognizer(panGesture)
	}

	@objc func handlePan(_ gesture: UIPanGestureRecognizer) {
			guard let superview = superview else { return }
			let translation = gesture.translation(in: superview)

			switch gesture.state {
			case .changed:
				center = CGPoint(x: center.x + translation.x, y: center.y + translation.y)
				gesture.setTranslation(.zero, in: superview)
				// Do not show radial menu here
			case .ended:
				isDragging = false
				resetPosition()
			default: break
			}
		}

	private func resetPosition() {
		UIView.animate(withDuration: 0.3) {
			self.center = self.originalPosition  // Reset to original position
		}
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
	}

}
