import UIKit

/// `rootView` for `AuthViewController`
final class AuthRootView: UIView {

	// MARK: Login Screen

	let signInVerticalStackView = UIStackView()
	let signInEmailTextField = UITextField()
	let signInPasswordTextField = UITextField()

	let signInHorizontalStackView = UIStackView()
	let signInButtton = UIButton()
	let signUpButton = UIButton()

	let resetPasswordButton = UIButton()

	// MARK: Registration Screen

	let signUpVerticalStackView = UIStackView()
	let signUpEmailTextField = UITextField()
	let signUpPasswordTextField = UITextField()
	let signUpRepeatPasswordTextField = UITextField()
	let createButton = UIButton()

	// MARK: - Password Recovery Screen

	let resetPasswordVerticalStackView = UIStackView()
	let resetPasswordEmailTextField = UITextField()
	let confirmButton = UIButton()
}
