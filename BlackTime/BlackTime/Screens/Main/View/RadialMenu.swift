import UIKit
import SnapKit


final class RadialMenuView: UIView {

	var buttons: [UIView] = []
	let radius: CGFloat = 100
	let arcAngle: CGFloat = .pi / 2 // 90 degrees
}


// MARK: - Private Methods

// MARK: - Embed Views

private extension RadialMenuView {

	func embedViews() {

	}
}

// MARK: - Setup Layout

private extension RadialMenuView {

	func setupLayout() {


	}
}

// MARK: - Setup Appearance

private extension RadialMenuView {

	func setupAppearance() {

	}
}

// MARK: - Setup Data

private extension RadialMenuView {

	func setupData() {

	}
}

// MARK: - Setup Behaviour

private extension TimeTossButton {

	func setupBehaviour() {


	}
}

/*
 // RadialMenuView.swift
 class RadialMenuView: UIView {
	 var buttons: [UIButton] = []
	 let radius: CGFloat = 100
	 let arcAngle: CGFloat = .pi / 2 // 90 degrees

	 init(options: [String], center: CGPoint) {
		 super.init(frame: .zero)
		 setupMenu(options: options, center: center)
	 }

	 required init?(coder: NSCoder) {
		 fatalError("init(coder:) has not been implemented")
	 }

	 private func setupMenu(options: [String], center: CGPoint) {
		 for (index, option) in options.enumerated() {
			 let button = UIButton(type: .system)
			 button.setTitle(option, for: .normal)
			 button.backgroundColor = .systemBlue
			 button.layer.cornerRadius = 20
			 buttons.append(button)
			 self.addSubview(button)
		 }
		 layoutButtons(center: center)
	 }

	 private func layoutButtons(center: CGPoint) {
		 let angleIncrement = arcAngle / CGFloat(buttons.count - 1)
		 for (index, button) in buttons.enumerated() {
			 let angle = -arcAngle / 2 + angleIncrement * CGFloat(index)
			 let x = center.x + radius * cos(angle)
			 let y = center.y + radius * sin(angle)
			 button.frame = CGRect(x: x, y: y, width: 40, height: 40)
		 }
	 }

	 func show() {
		 self.isHidden = false
		 UIView.animate(withDuration: 0.3) {
			 self.alpha = 1
		 }
	 }

	 func hide() {
		 UIView.animate(withDuration: 0.3, animations: {
			 self.alpha = 0
		 }) { _ in
			 self.isHidden = true
		 }
	 }
 }

 // TimeTossButton.swift
 class TimeTossButton: UIButton {
	 var radialMenu: RadialMenuView?

	 override init(frame: CGRect) {
		 super.init(frame: frame)
		 setupButton()
	 }

	 required init?(coder: NSCoder) {
		 super.init(coder: coder)
		 setupButton()
	 }

	 private func setupButton() {
		 self.backgroundColor = .systemBlue
		 self.layer.cornerRadius = 25
		 self.setTitle("+", for: .normal)
		 self.titleLabel?.font = UIFont.systemFont(ofSize: 24)

		 // Add tap action to show radial menu
		 self.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
	 }

	 @objc private func handleTap() {
		 if radialMenu == nil {
			 radialMenu = RadialMenuView(options: ["Option 1", "Option 2", "Option 3"], center: self.center)
			 self.superview?.addSubview(radialMenu!)
		 }
		 radialMenu?.show()
	 }
 }
 */
