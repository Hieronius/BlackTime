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
		radialMenu.isHidden = false
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
