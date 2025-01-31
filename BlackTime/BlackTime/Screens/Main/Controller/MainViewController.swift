import UIKit
import SnapKit
import SideMenu

/// `Main Screen` to display current day's statistic and existing time to spend
final class MainViewController: GenericViewController<MainRootView> {

	// MARK: - Properties

	let timeTracker = TimeTracker()


	// MARK: - Initialization

	init() {
		super.init(nibName: nil, bundle: nil)

	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Life Cycle

	override func viewDidLoad() {
		super.viewDidLoad()

		setupNavigationBar()
		setupSideMenu()
		updateTimeCharView()
		setupControls()
	}
}

// MARK: - Setup Navigation Bar

private extension MainViewController {

	func setupNavigationBar() {

		let sandwichMenuButton = UIBarButtonItem(

			image: UIImage(systemName: "line.3.horizontal"),
			style: .plain,
			target: self,
			action: #selector(toggleMenu)
		)

		sandwichMenuButton.tintColor = AppColors.actionColor
		navigationItem.leftBarButtonItem = sandwichMenuButton

		let calendarButton = UIBarButtonItem(

			image: UIImage(systemName: "calendar"),
			style: .plain,
			target: self,
			action: #selector(toggleCalendar)

		)

		calendarButton.tintColor = AppColors.actionColor
		navigationItem.rightBarButtonItem = calendarButton
	}

	@objc func toggleMenu() {

		guard let sideMenu = SideMenuManager.default.leftMenuNavigationController else { return }
		present(sideMenu, animated: true, completion: nil)
	}

	@objc func toggleCalendar() {

		// Open-close Calendar
	}
}

// MARK: - Setup Side Menu

private extension MainViewController {

	func setupSideMenu() {

		let menuVC = SideMenuViewController()
		let sideMenu = SideMenuNavigationController(rootViewController: menuVC)

		sideMenu.leftSide = true

		SideMenuManager.default.leftMenuNavigationController = sideMenu

		SideMenuManager.default.addScreenEdgePanGesturesToPresent(toView: self.view, forMenu: .left)
		SideMenuManager.default.addPanGestureToPresent(toView: self.navigationController!.view)
	}
}

// MARK: - Setup timeChartView

private extension MainViewController {

	private func updateTimeCharView() {

		rootView.timeChartView.categories = timeTracker.categories
		rootView.timeChartView.remainingHours = timeTracker.remainingHours
	}

	func setupControls() {

		let stack = UIStackView()
		stack.axis = .vertical
		stack.spacing = 8

		for category in timeTracker.categories {
			let button = UIButton()
			button.setTitle("Add 1h to \(category.name)", for: .normal)
			button.backgroundColor = category.color
			button.addTarget(self, action: #selector(didTapAddHour(_:)), for: .touchUpInside)
			stack.addArrangedSubview(button)
		}

		rootView.addSubview(stack)

		stack.snp.makeConstraints { make in
			make.centerX.equalToSuperview()
			make.top.equalTo(rootView.timeChartView.snp.bottom).offset(40)
		}
	}

	@objc func didTapAddHour(_ sender: UIButton) {

		guard let title = sender.titleLabel?.text,
			  let categoryName = title.components(separatedBy: " ").last else { return }

		timeTracker.addHours(1, to: categoryName)

		updateTimeCharView()
	}
}
