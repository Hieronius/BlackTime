import UIKit
import SnapKit

final class AuthorisationViewController: UIViewController {

	let mainStackView = UIStackView()
	let view1 = UIView()
	let view2 = UIView()
	let view3 = UIView()


	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.

		view.addSubview(mainStackView)

		mainStackView.axis = .vertical
		mainStackView.spacing = 5
		mainStackView.backgroundColor = .yellow

		mainStackView.addArrangedSubview(view1)
		mainStackView.addArrangedSubview(view2)
		mainStackView.addArrangedSubview(view3)

		view1.backgroundColor = AppColors.primaryColor
		view2.backgroundColor = AppColors.secondaryColor
		view3.backgroundColor = AppColors.actionColor

		mainStackView.snp.makeConstraints { make in
			make.centerX.equalTo(view)
			make.centerY.equalTo(view)
			make.width.equalTo(100)
		}

		view1.snp.makeConstraints { make in
			make.height.equalTo(50)
		}

		view2.snp.makeConstraints { make in
			make.height.equalTo(50)
		}

		view3.snp.makeConstraints { make in
			make.height.equalTo(50)
		}

	}
}

