import UIKit
import SnapKit

/// `rootView` for `AuthViewController`
final class AuthRootView: UIView {

	// MARK: Login Screen

	let signInVerticalStackView = UIStackView()
	let signInEmailTextField = UITextField()
	let signInPasswordTextField = UITextField()

	let signInHorizontalStackView = UIStackView()
	let signInButton = UIButton()
	let signUpButton = UIButton()

	let resetPasswordButton = UIButton()

	// MARK: Registration Screen

	let signUpVerticalStackView = UIStackView()
	let signUpEmailTextField = UITextField()
	let signUpPasswordTextField = UITextField()
	let signUpRepeatPasswordTextField = UITextField()
	let createButton = UIButton()

	// MARK: Password Recovery Screen

	let resetPasswordVerticalStackView = UIStackView()
	let resetPasswordEmailTextField = UITextField()
	let confirmButton = UIButton()

	// MARK: Utility

	let cleaningButton = CleaningButton()

	// MARK: - Initialization

	init() {
		super.init(frame: .zero)

		embedViews()
		setupLayout()
		setupAppearance()
		setupBehaviour()
		setupData()
	}

	required init(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - Private Methods

// MARK: - Embed Views

private extension AuthRootView {

	func embedViews() {

		// MARK: Login Screen

		addSubviews([

			signInVerticalStackView,
			signInHorizontalStackView,
			resetPasswordButton
		])

		signInVerticalStackView.addArrangedSubviews([

			signInEmailTextField,
			signInPasswordTextField,
			signInHorizontalStackView
		])

		signInHorizontalStackView.addArrangedSubviews([

			signInButton,
			signUpButton
		])

		// MARK: Registration Screen


		// MARK: Password Recovery Screen

	}
}

// MARK: - Setup Layout

private extension AuthRootView {

	// MARK: Login Screen

	func setupLayout() {

		signInVerticalStackView.snp.makeConstraints { make in

			make.centerY.equalToSuperview()
			make.left.equalToSuperview().offset(20)
			make.right.equalToSuperview().offset(-20)
		}

		signInEmailTextField.snp.makeConstraints { make in

			make.height.equalTo(50)
		}

		signInPasswordTextField.snp.makeConstraints { make in

			make.height.equalTo(50)
		}

		signInButton.snp.makeConstraints { make in

			make.height.equalTo(50)
		}

		signUpButton.snp.makeConstraints { make in

			make.height.equalTo(50)
		}

		resetPasswordButton.snp.makeConstraints { make in

			make.height.equalTo(50)
			make.left.equalTo(safeAreaLayoutGuide).offset(20)
			make.right.equalTo(safeAreaLayoutGuide).offset(-20)
			make.bottom.equalTo(safeAreaLayoutGuide).offset(-20)
		}

		// MARK: Registration Screen


		// MARK: Password Recovery Screen


	}
}

// MARK: - Setup Appearance

private extension AuthRootView {

	func setupAppearance() {

		signInVerticalStackView.axis = .vertical
		signInVerticalStackView.spacing = 8

		signInEmailTextField.backgroundColor = AppColors.secondaryColor
		signInEmailTextField.tintColor = AppColors.primaryColor
		signInEmailTextField.textColor = AppColors.primaryColor
		signInEmailTextField.layer.cornerRadius = 15
		signInEmailTextField.clipsToBounds = true

		signInPasswordTextField.backgroundColor = AppColors.secondaryColor
		signInPasswordTextField.tintColor = AppColors.primaryColor
		signInPasswordTextField.textColor = AppColors.primaryColor
		signInPasswordTextField.layer.cornerRadius = 15
		signInPasswordTextField.clipsToBounds = true

		signInHorizontalStackView.axis = .horizontal
		signInHorizontalStackView.spacing = 8
		signInHorizontalStackView.distribution = .fillEqually

		signInButton.setTitleColor(AppColors.primaryColor, for: .normal)
		signInButton.backgroundColor = AppColors.actionColor
		signInButton.layer.cornerRadius = 15
		signInButton.clipsToBounds = true

		signUpButton.setTitleColor(AppColors.primaryColor, for: .normal)
		signUpButton.backgroundColor = AppColors.secondaryColor
		signUpButton.layer.cornerRadius = 15
		signUpButton.clipsToBounds = true

		resetPasswordButton.setTitleColor(AppColors.primaryColor, for: .normal)
		resetPasswordButton.backgroundColor = AppColors.secondaryColor
		resetPasswordButton.layer.cornerRadius = 15
		resetPasswordButton.clipsToBounds = true

		// MARK: Registration Screen


		// MARK: Password Recovery Screen



		// setup font/color/shape here
		// 44 height for buttons
		// 16-20 for margins/paddings to safe area
		// 8-12 for stack view spacing
		// 15-22 height for text fields
	}
}

// MARK: - Setup Behaviour

private extension AuthRootView {

	func setupBehaviour() {

		// MARK: Login Screen

		signInEmailTextField.rightView = cleaningButton
		signInEmailTextField.rightViewMode = .whileEditing
		signInEmailTextField.textContentType = .oneTimeCode

		signInPasswordTextField.rightView = cleaningButton
		signInPasswordTextField.rightViewMode = .whileEditing
		signInPasswordTextField.textContentType = .oneTimeCode

		// setup actions / delegates here

		// MARK: Registration Screen


		// MARK: Password Recovery Screen
	}
}

// MARK: - Setup Data

private extension AuthRootView {

	func setupData() {

		// MARK: Login Screen

		signInEmailTextField.placeholder = " Email@company.com"

		signInPasswordTextField.placeholder = " Password"

		signInButton.setTitle("Sign In", for: .normal)

		signUpButton.setTitle("Sign Up", for: .normal)

		resetPasswordButton.setTitle("Reset Password", for: .normal)

		// setup content/names/labels/placeholders here

		// MARK: Registration Screen


		// MARK: Password Recovery Screen
	}
}

// MARK: - Setup Custom Placeholder

private extension AuthRootView {

	// put your custom textField as input argument
	func setupCustomPlaceholder(_ textField: UITextField) {

			let placeholderText = "Enter your text here"
			let attributes: [NSAttributedString.Key: Any] = [
				.foregroundColor: UIColor.lightGray,
				.font: UIFont.systemFont(ofSize: 16)
			]
			textField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: attributes)
		}
}


