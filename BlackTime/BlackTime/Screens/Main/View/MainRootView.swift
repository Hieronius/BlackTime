import UIKit
import SnapKit

/// `root View` of the Main Screen
final class MainRootView: UIView {

	// MARK: - Properties

	let timeChartView = CircularTimeChartView()

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
	}
}

// MARK: - Setup Appearance

private extension MainRootView {

	func setupAppearance() {

		backgroundColor = AppColors.primaryColor

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
