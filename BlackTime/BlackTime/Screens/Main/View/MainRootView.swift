import UIKit
import SnapKit

/// `root View` of the Main Screen
final class MainRootView: UIView {

	// MARK: - Properties

	/// Custom View to display daily time spending and remaining time
	let timeChartView = CircularTimeChartView()

	/// Button to drag and drop a new time spending operation
	let tossButton = TimeTossButton()

	/// Radial menu with time spending categories
	let radialMenu = RadialMenuView(categories: [])

	/// Original position of the `TossButton`
	var tossButtonPosition: CGPoint = CGPoint(x: 250, y: 250)

	// MARK: - Initialization

	init() {
		super.init(frame: .zero)

		embedViews()
		setupLayout()
		setupAppearance()
		setupData()
		setupBehaviour()

	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func layoutSubviews() {
		super.layoutSubviews()

		// Convert button's original position to our coordinate system
		DispatchQueue.main.asyncAfter(deadline: .now(
		) + 1) {
			let convertedPosition = self.convert(self.tossButton.originalPosition, from: self.tossButton.superview)
			self.radialMenu.center = convertedPosition
			print(self.radialMenu.center)
		}

//		radialMenu.center = tossButtonPosition
	}

	
}

// MARK: - Private Methods

// MARK: - Embed Views

private extension MainRootView {

	func embedViews() {

		addSubview(timeChartView)
		addSubview(radialMenu)

		addSubview(tossButton)
	}
}

// MARK: - Setup Layout

private extension MainRootView {

	func setupLayout() {

		timeChartView.snp.makeConstraints { make in
			make.width.equalTo(300)
			make.height.equalTo(300)
			make.center.equalToSuperview()
		}

		tossButton.snp.makeConstraints { make in
			make.bottom.equalTo(safeAreaLayoutGuide).offset(-60)
			make.right.equalTo(safeAreaLayoutGuide).offset(-20)
		}

		// MARK: BE READY TO GET BACK
		radialMenu.snp.makeConstraints { make in
			make.center.equalTo(tossButton)
			make.width.height.equalTo(200)
		}
	}
}

// MARK: - Setup Appearance

private extension MainRootView {

	func setupAppearance() {

		backgroundColor = AppColors.primaryColor
		timeChartView.backgroundColor = AppColors.primaryColor
		radialMenu.isHidden = true
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
