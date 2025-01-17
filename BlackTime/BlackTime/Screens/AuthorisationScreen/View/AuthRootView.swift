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

		addSubview(signUpVerticalStackView)

		signUpVerticalStackView.addArrangedSubviews([

			signUpEmailTextField,
			signUpPasswordTextField,
			signUpRepeatPasswordTextField,
			createButton
		])

		// MARK: Password Recovery Screen

		addSubview(resetPasswordVerticalStackView)

		resetPasswordVerticalStackView.addArrangedSubviews([

			resetPasswordEmailTextField,
			confirmButton
		])

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

		signUpVerticalStackView.snp.makeConstraints { make in

			make.centerY.equalToSuperview()
			make.left.equalToSuperview().offset(20)
			make.right.equalToSuperview().offset(-20)
		}

		signUpEmailTextField.snp.makeConstraints { make in

			make.height.equalTo(50)
		}

		signUpPasswordTextField.snp.makeConstraints { make in

			make.height.equalTo(50)
		}

		signUpRepeatPasswordTextField.snp.makeConstraints { make in

			make.height.equalTo(50)
		}

		createButton.snp.makeConstraints { make in

			make.height.equalTo(50)
		}

		// MARK: Password Recovery Screen

		resetPasswordVerticalStackView.snp.makeConstraints { make in

			make.centerY.equalToSuperview()
			make.left.equalToSuperview().offset(20)
			make.right.equalToSuperview().offset(-20)
		}

		resetPasswordEmailTextField.snp.makeConstraints { make in

			make.height.equalTo(50)
		}

		confirmButton.snp.makeConstraints { make in

			make.height.equalTo(50)
		}
	}
}

// MARK: - Setup Appearance

private extension AuthRootView {

	func setupAppearance() {

		// MARK: Login Screen

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

		signUpVerticalStackView.axis = .vertical
		signUpVerticalStackView.spacing = 8

		signUpEmailTextField.backgroundColor = AppColors.secondaryColor
		signUpEmailTextField.tintColor = AppColors.primaryColor
		signUpEmailTextField.textColor = AppColors.primaryColor
		signUpEmailTextField.layer.cornerRadius = 15
		signUpEmailTextField.clipsToBounds = true

		signUpPasswordTextField.backgroundColor = AppColors.secondaryColor
		signUpPasswordTextField.tintColor = AppColors.primaryColor
		signUpPasswordTextField.textColor = AppColors.primaryColor
		signUpPasswordTextField.layer.cornerRadius = 15
		signUpPasswordTextField.clipsToBounds = true

		signUpRepeatPasswordTextField.backgroundColor = AppColors.secondaryColor
		signUpRepeatPasswordTextField.tintColor = AppColors.primaryColor
		signUpRepeatPasswordTextField.textColor = AppColors.primaryColor
		signUpRepeatPasswordTextField.layer.cornerRadius = 15
		signUpRepeatPasswordTextField.clipsToBounds = true

		createButton.setTitleColor(AppColors.primaryColor, for: .normal)
		createButton.backgroundColor = AppColors.actionColor
		createButton.layer.cornerRadius = 15
		createButton.clipsToBounds = true

		// MARK: Password Recovery Screen

		resetPasswordVerticalStackView.axis = .vertical
		resetPasswordVerticalStackView.spacing = 8

		resetPasswordEmailTextField.backgroundColor = AppColors.secondaryColor
		resetPasswordEmailTextField.tintColor = AppColors.primaryColor
		resetPasswordEmailTextField.textColor = AppColors.primaryColor
		resetPasswordEmailTextField.layer.cornerRadius = 15
		resetPasswordEmailTextField.clipsToBounds = true

		confirmButton.setTitleColor(AppColors.primaryColor, for: .normal)
		confirmButton.backgroundColor = AppColors.actionColor
		confirmButton.layer.cornerRadius = 15
		confirmButton.clipsToBounds = true
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

		// MARK: Registration Screen

		signUpVerticalStackView.isHidden = true

		signUpEmailTextField.rightView = cleaningButton
		signUpEmailTextField.rightViewMode = .whileEditing
		signUpEmailTextField.textContentType = .oneTimeCode

		signUpPasswordTextField.rightView = cleaningButton
		signUpPasswordTextField.rightViewMode = .whileEditing
		signUpPasswordTextField.textContentType = .oneTimeCode

		signUpRepeatPasswordTextField.rightView = cleaningButton
		signUpRepeatPasswordTextField.rightViewMode = .whileEditing
		signUpRepeatPasswordTextField.textContentType = .oneTimeCode

		// MARK: Password Recovery Screen

		resetPasswordVerticalStackView.isHidden = true

		resetPasswordEmailTextField.rightView = cleaningButton
		resetPasswordEmailTextField.rightViewMode = .whileEditing
		resetPasswordEmailTextField.textContentType = .oneTimeCode
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

		// MARK: Registration Screen

		signUpEmailTextField.placeholder = " Email@company.com"

		signUpPasswordTextField.placeholder = " Password"

		signUpRepeatPasswordTextField.placeholder = "Repeat Password"

		createButton.setTitle("Create", for: .normal)

		// MARK: Password Recovery Screen

		resetPasswordEmailTextField.placeholder = " Email@company.com"

		confirmButton.setTitle("Confirm", for: .normal)
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


