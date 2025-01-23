import UIKit

/// Custom View to display a chart with remaining hours and time spending categories
final class CircularTimeView: UIView {

	private var trackLayers: [CAShapeLayer] = []
	
	var categories: [TimeCategory] = [] {
		didSet {
			updateLayers()
		}
	}

	override func layoutSubviews() {
		super.layoutSubviews()
		updateLayers()
	}

	private func updateLayers() {
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
