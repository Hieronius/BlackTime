import UIKit

/// Controller to manage `SideMenu` content
final class SideMenuViewController: GenericViewController<SideMenuRootView> {

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
		print("Got SideMenu")
	}
}
