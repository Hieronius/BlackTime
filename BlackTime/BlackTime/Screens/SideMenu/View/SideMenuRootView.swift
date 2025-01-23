import UIKit
import SnapKit

/// `rootView` for SideMenuViewController
final class SideMenuRootView: UIView {

	// MARK: - Properties

	let menuStackView = UIStackView()
	let profileButton = UIButton()
	let optionsButton = UIButton()
	let categoriesButton = UIButton()
	let statisticsButton = UIButton()
	let historyButton = UIButton()
	let premiumButton = UIButton()

	// add more

	// MARK: - Initialization

	init() {
		super.init(frame: .zero)

		embedViews()
		setupLayout()
		setupAppearance()
		setupBehaviour()
		setupData()
	}

	required init?(coder: NSCoder) {
		fatalError("NSCoder has not been implemented")
	}
}

// MARK: - Private Methods

// MARK: - Embed Views

private extension SideMenuRootView {

	func embedViews() {

		addSubview(menuStackView)

		menuStackView.addArrangedSubviews([

			profileButton,
			optionsButton,
			categoriesButton,
			statisticsButton,
			historyButton,
			premiumButton
		])
	}
}

// MARK: - Setup Layout

private extension SideMenuRootView {

	func setupLayout() {

		menuStackView.snp.makeConstraints { make in

			make.top.equalTo(safeAreaLayoutGuide).offset(20)
			make.left.equalTo(safeAreaLayoutGuide).offset(20)
			make.right.equalTo(safeAreaLayoutGuide).offset(-20)
		}

		[
			profileButton,
			optionsButton,
			categoriesButton,
			statisticsButton,
			historyButton,
			premiumButton
		]
			.forEach { view in
				view.snp.makeConstraints { make in
					make.height.equalTo(50)
				}
			}
	}
}

// MARK: - Setup Appearance

private extension SideMenuRootView {

	func setupAppearance() {

		backgroundColor = AppColors.primaryColor

		menuStackView.axis = .vertical
		menuStackView.spacing = 10

		[
			profileButton,
			optionsButton,
			categoriesButton,
			statisticsButton,
			historyButton,
			premiumButton
		]
			.forEach { view in
				view.setTitleColor(AppColors.primaryColor, for: .normal)
				view.backgroundColor = AppColors.secondaryColor
				view.layer.cornerRadius = 15
				view.clipsToBounds = true
			}
	}
}

// MARK: - Setup Behaviour

private extension SideMenuRootView {

	func setupBehaviour() {

		// MARK: Use this for passing delegates to Controller
		// Controller should dismiss it's self and by asking
		// MainViewController push the screen you pressed the button for

	}
}

// MARK: - Setup Data

private extension SideMenuRootView {

	func setupData() {

		profileButton.setTitle("Profile", for: .normal)
		optionsButton.setTitle("Options", for: .normal)
		categoriesButton.setTitle("Categories", for: .normal)
		statisticsButton.setTitle("Statistics", for: .normal)
		historyButton.setTitle("History", for: .normal)
		premiumButton.setTitle("Premium", for: .normal) // with some nice animation
	}
}
