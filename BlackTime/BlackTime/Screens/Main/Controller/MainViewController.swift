import UIKit
import SideMenu

/// `Main Screen` to display current day's statistic and existing time to spend
final class MainViewController: GenericViewController<MainRootView> {

	// MARK: - Initialization

	init() {
		super.init(nibName: nil, bundle: nil)

		// pass dependencies there
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Life Cycle

	override func viewDidLoad() {
		super.viewDidLoad()

		setupNavigationBar()
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

		let menu = SideMenuNavigationController(rootViewController: self)
		present(menu, animated: true, completion: nil)

		// Open-close sandwich menu
	}

	@objc func toggleCalendar() {

		// Open-close Calendar
	}

	// actions for buttons

}
