import UIKit
import SnapKit

final class AuthViewController: GenericViewController<AuthRootView> {

	override func viewDidLoad() {
		super.viewDidLoad()

		rootView.backgroundColor = AppColors.primaryColor
	}
}

