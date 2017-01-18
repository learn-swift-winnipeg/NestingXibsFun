import UIKit

// MARK: - DesignedInXibAndNestableInOtherXibsViewProtocol

/**
 Allows conforming UIView subclass to load views designed in Xib file. Views are then "Designable" via the `@IBDesignable` attribute and will render in Storyboards and other Xib files.
 
 Usage Requirements:
 1. Conforming classes must be accompanied by Xib file with identical name as conforming class. i.e. `class DesignedInXibView` and `DesignedInXibView.xib`
 2. `File's Owner Class:` in IB must be set to conforming class. i.e. `File's Owner Class: DesignedInXibView`
 3. All `init` functions of confroming class must call `setupViewFromXib()`.
 */
protocol DesignedInXibAndNestableInOtherXibsViewProtocol: class {
    var viewFromXib: UIView! { get set }
}

// MARK: - DesignedInXibAndNestableInOtherXibsViewProtocol extension

extension DesignedInXibAndNestableInOtherXibsViewProtocol where Self: UIView {
    func setupViewFromXib() {
        // Instantiate view designed in .xib
        viewFromXib = instantiateViewFromXib()
        
        // Add viewFromXib to actual view at base of hierarchy so other views from Storyboard/Xib will appear on top.
        self.insertSubview(viewFromXib, at: 0)
        
        // Add layout constraints so the viewFromXib always fills the actual view.
        viewFromXib.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            viewFromXib.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            viewFromXib.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            viewFromXib.topAnchor.constraint(equalTo: self.topAnchor),
            viewFromXib.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func instantiateViewFromXib() -> UIView {
        // Load Xib with same name as conforming class.
        // Xib filename would need to be provided here if class and Xib filename are not identical.
        // Note: The bundle for this class must be specified! We often pass in nil for the bundle argument assuming that the main bundle will work. However passing in nil here will result in IB's layout engine crashing because apparently it does not use the main bundle... or something?
        let bundle = Bundle(for: type(of: self))
        let nibName = String(describing: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
}
