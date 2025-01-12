import UIKit

extension UIColor {

	// Initialize UIColor from a hex string
	convenience init?(hex: String) {
		let r, g, b, a: CGFloat

		if hex.hasPrefix("#") {
			let start = hex.index(hex.startIndex, offsetBy: 1)
			let hexColor = String(hex[start...])

			var hexNumber: UInt64 = 0
			if Scanner(string: hexColor).scanHexInt64(&hexNumber) {
				switch hexColor.count {
				case 6: // RGB (24-bit)
					r = CGFloat((hexNumber & 0xFF0000) >> 16) / 255.0
					g = CGFloat((hexNumber & 0x00FF00) >> 8) / 255.0
					b = CGFloat(hexNumber & 0x0000FF) / 255.0
					a = 1.0
				case 8: // ARGB (32-bit)
					r = CGFloat((hexNumber & 0xFF000000) >> 24) / 255.0
					g = CGFloat((hexNumber & 0x00FF0000) >> 16) / 255.0
					b = CGFloat((hexNumber & 0x0000FF00) >> 8) / 255.0
					a = CGFloat(hexNumber & 0x000000FF) / 255.0
				default:
					return nil
				}

				self.init(red: r, green: g, blue: b, alpha: a)
				return
			}
		}
		return nil
	}
}
