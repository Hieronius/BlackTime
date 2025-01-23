import UIKit

/// `Authorisation screen` which responsible for Registration, Password recovery and LoginIn functions
final class AuthViewController: GenericViewController<AuthRootView> {

	// MARK: Private Properties

	/// Type of the screen user would see accordingly to the login stage
	private var authMode: AuthMode = .login {
		didSet {
			// MARK: Implement the function to switch the set of views to display
		}
	}

	/// Property to store current user's session state to process a new operations or to load the old ones
	private var isInitialAppLaunch = true

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

		title = "Login Screen"

		setupNavigationBar()

	}
}

// MARK: - Private Methods

// MARK: - Setup Navigation Controller

private extension AuthViewController {

	func setupNavigationBar() {

		let changeModeButton = UIBarButtonItem(

			image: UIImage(systemName: "line.3.horizontal"),
			style: .plain,
			target: self,
			action: #selector(changeMode)
		)

		changeModeButton.tintColor = AppColors.actionColor
		navigationItem.leftBarButtonItem = changeModeButton

		let toMainScreenButton = UIBarButtonItem(

			image: UIImage(systemName: "chevron.right"),
			style: .plain,
			target: self,
			action: #selector(moveToMain)

			)

		toMainScreenButton.tintColor = AppColors.actionColor
		navigationItem.rightBarButtonItem = toMainScreenButton
	}

	@objc func changeMode() {

		switch authMode {

		case .login:

			authMode = .registration
			title = "Registration"
			rootView.signInVerticalStackView.isHidden = true
			rootView.resetPasswordButton.isHidden = true
			rootView.signUpVerticalStackView.isHidden = false

		case .registration:

			authMode = .passwordRecovery
			title = "Password Recovery"
			rootView.signUpVerticalStackView.isHidden = true
			rootView.resetPasswordVerticalStackView.isHidden = false

		case .passwordRecovery:

			title = "Login"
			authMode = .login
			rootView.resetPasswordVerticalStackView.isHidden = true
			rootView.signInVerticalStackView.isHidden = false
			rootView.resetPasswordButton.isHidden = false
		}
	}

	@objc func moveToMain() {
		let vc = MainViewController()
		navigationController?.setViewControllers([vc], animated: true)
	}
}

