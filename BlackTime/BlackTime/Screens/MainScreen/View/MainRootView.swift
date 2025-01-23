import UIKit

/// `root View` of the Main Screen
final class MainRootView: UIView {

	// MARK: - Initialization

	init() {
		super.init(frame: .zero)
		print("got root view")
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
