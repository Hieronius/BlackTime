#  ToDoList

## 1. Create MainScreen

1.3. For this Chart you have custom View and full list of instructions here
After OPTIONALS
1.4. Button "+" or "num of min" to start to add values

## 2. New Operation Screen

2.1. View to change "+" button value of minutes from 1 to 30-60

## 3. Statistics Screen

## 4. Calendar View

## 5. Sandwich Menu

1.1.2. Create any required entities for side menu and files for them
1.1.3. Each button for "Options/Profile/etc." should dismiss menu and ask MainViewController to push/present a new screen

## 6. History



## Optional

1. Instal IQKeyboardManager or find the way to make keyboard elements as black/white colors
2. Put `EmailValidation` extension to AuthorisationManager
3. Add AlertControllers for all operation with Login/Registration/Authorisation
4. Remove AuthScreen from NavigationStackView when you in the main screen
5. Process all textFields/buttons in AuthScreen accordingly to BlackToDoList by style and safety
6. Splash/Loading screen with App Logo

# MainScreenChart

For your requirements, the best approach in **UIKit** (iOS 15+, Xcode 14.2) is to create a **custom circular progress view** with segmented categories, similar to a "donut chart" or "radial progress chart." Here's a step-by-step breakdown:

---

### **1. Key Components**
- **Custom UIView Subclass**: To draw the segmented circle.
- **CAShapeLayer + UIBezierPath**: For rendering arcs with different colors.
- **Data Model**: Track time categories and their durations.
- **Real-Time Updates**: Use observers or delegation to refresh the view when data changes.

---

### **2. Data Model**
Define a struct to track time categories and their durations:
```swift
struct TimeCategory {
    let name: String
    let color: UIColor
    var hours: Double // e.g., 8.0 hours for "working"
}

class TimeTracker {
    var categories: [TimeCategory] = [
        TimeCategory(name: "Cleaning", color: .systemBlue, hours: 0),
        TimeCategory(name: "Working", color: .systemGreen, hours: 0),
        TimeCategory(name: "Resting", color: .systemOrange, hours: 0)
    ]
    
    var remainingHours: Double {
        24 - categories.reduce(0) { $0 + $1.hours }
    }
    
    func addHours(_ hours: Double, to category: String) {
        guard let index = categories.firstIndex(where: { $0.name == category }) else { return }
        categories[index].hours += hours
    }
}
```

---

### **3. Custom Circular View**
Create a `UIView` subclass to draw the segmented circle:
```swift
class CircularTimeView: UIView {
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
```

---

### **4. Usage in ViewController**
#### **A. Add the Circular View**
```swift
class ViewController: UIViewController {
    let timeTracker = TimeTracker()
    let circularView = CircularTimeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCircularView()
        setupControls()
    }
    
    private func setupCircularView() {
        circularView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        circularView.center = view.center
        circularView.categories = timeTracker.categories
        view.addSubview(circularView)
    }
}
```

#### **B. Add Controls to Update Categories**
```swift
private func setupControls() {
    let stack = UIStackView()
    stack.axis = .vertical
    stack.spacing = 8
    
    for category in timeTracker.categories {
        let button = UIButton()
        button.setTitle("Add 1h to \(category.name)", for: .normal)
        button.backgroundColor = category.color
        button.addTarget(self, action: #selector(didTapAddHour(_:)), for: .touchUpInside)
        stack.addArrangedSubview(button)
    }
    
    stack.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(stack)
    
    NSLayoutConstraint.activate([
        stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        stack.topAnchor.constraint(equalTo: circularView.bottomAnchor, constant: 40)
    ])
}

@objc private func didTapAddHour(_ sender: UIButton) {
    guard let title = sender.titleLabel?.text,
          let categoryName = title.components(separatedBy: " ").last else { return }
    
    timeTracker.addHours(1, to: categoryName)
    circularView.categories = timeTracker.categories
}
```

---

### **5. Enhancements**
#### **A. Animations**
Add smooth transitions when updating segments:
```swift
private func updateLayers() {
    // ... existing code ...
    let animation = CABasicAnimation(keyPath: "strokeEnd")
    animation.fromValue = 0
    animation.toValue = 1
    animation.duration = 0.5
    layer.add(animation, forKey: "strokeAnimation")
}
```

#### **B. Labels**
Add a center label to show remaining hours:
```swift
private let centerLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    label.font = .systemFont(ofSize: 24, weight: .bold)
    return label
}()

// Inside updateLayers():
centerLabel.text = "\(timeTracker.remainingHours)h left"
```

#### **C. Legend**
Add a legend below the circle to explain categories:
```swift
private func setupLegend() {
    let stack = UIStackView()
    stack.axis = .horizontal
    stack.spacing = 16
    
    for category in categories {
        let dot = UIView()
        dot.backgroundColor = category.color
        dot.widthAnchor.constraint(equalToConstant: 20).isActive = true
        dot.heightAnchor.constraint(equalToConstant: 20).isActive = true
        dot.layer.cornerRadius = 10
        
        let label = UILabel()
        label.text = "\(category.name): \(category.hours)h"
        
        let row = UIStackView(arrangedSubviews: [dot, label])
        row.spacing = 8
        stack.addArrangedSubview(row)
    }
    
    // Add to view hierarchy...
}
```

---

### **6. Libraries (Optional)**
If you need advanced features (e.g., interactivity, pinch-to-zoom), consider:
- **Charts (MPAndroidChart port)**: [Charts](https://github.com/danielgindi/Charts)
- **SwiftCharts**: [SwiftCharts](https://github.com/ivanschuetz/SwiftCharts)

But for your use case, a **custom solution** is lighter and more flexible.

---

### **Final Result**
You’ll get a dynamic, real-time circle that:
- Shows 24h as a full circle.
- Updates segments when hours are added to categories.
- Displays remaining time in the center.
- Matches iOS design standards.

Let me know if you need help refining any part! 🚀
