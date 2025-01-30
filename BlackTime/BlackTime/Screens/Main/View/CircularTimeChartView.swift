import UIKit
import SnapKit

/// Custom View to display a chart with remaining hours and time spending categories
final class CircularTimeChartView: UIView {

	// MARK: - Properties

	private var trackLayers: [CAShapeLayer] = []
	private let centerLabel = UILabel()
	
	var categories: [TimeCategory] = [] {
		didSet {
			updateLayers()
		}
	}

	var remainingHours: Double = 0 {
		didSet {
			updateCenterLabel()
		}
	}

	// MARK: - Initialization

	override init(frame: CGRect) {
		super.init(frame: frame)
		embedViews()
		setupLayout()
		setupAppearance()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Layout

	override func layoutSubviews() {
		super.layoutSubviews()
		updateLayers()
	}
}

// MARK: - Private Methods

// MARK: - Embed Views

private extension CircularTimeChartView {

	func embedViews() {

		addSubview(centerLabel)
	}

}

// MARK: - Setup Layout

private extension CircularTimeChartView {

	func setupLayout() {

		centerLabel.snp.makeConstraints { make in
			make.centerX.equalToSuperview()
			make.centerY.equalToSuperview()
		}
	}
}

// MARK: - Setup Appearance

private extension CircularTimeChartView {

	func setupAppearance() {

		centerLabel.textAlignment = .center
		centerLabel.font = .systemFont(ofSize: 24, weight: .bold)
		centerLabel.textColor = AppColors.actionColor
	}
}

// MARK: - Setup Behaviour

private extension CircularTimeChartView {

	func updateCenterLabel() {

		centerLabel.text = "\(remainingHours) hours"
	}

	// MARK: TODO - Provide Documentation
	func updateLayers() {
		// Remove old layers
		trackLayers.forEach { $0.removeFromSuperlayer() }
		trackLayers.removeAll()

		// Draw new segments
		let center = CGPoint(x: bounds.midX, y: bounds.midY)
		let radius = min(bounds.width, bounds.height) / 2 - 10
		var startAngle: CGFloat = -.pi / 2 // Start at top (12 o'clock)

		for category in categories {
			let endAngle = startAngle + (2 * .pi * CGFloat(category.hours / 24))

			let path = UIBezierPath(
				arcCenter: center,
				radius: radius,
				startAngle: startAngle,
				endAngle: endAngle,
				clockwise: true
			)

			let layer = CAShapeLayer()
			layer.path = path.cgPath
			layer.strokeColor = category.color.cgColor
			layer.fillColor = UIColor.clear.cgColor
			layer.lineWidth = 20 // Adjust thickness
			layer.lineCap = .round

			self.layer.addSublayer(layer)
			trackLayers.append(layer)

			startAngle = endAngle
		}
	}
}
