import UIKit

@IBDesignable
class DesignableXibView: UIView {

    // MARK: - Stored Properties
    
    private var contentView: UIView!
    
    // MARK: - Lifecycle
    
    // Must be defined or else Storyboard rendering crashes with vague error.
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupXib()
    }
    
    // Required by compiler when init(frame:) is overridden.
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupXib()
    }
    
    // MARK: - Setup
    
    private func setupXib() {
        contentView = loadViewFromNib()
        
        // Add contentView to actual view.
        self.addSubview(contentView)
        
        // Add layout constraints so the contentView always fills the actual view.
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    private func loadViewFromNib() -> UIView {
        // Load nib/xib with same name as this class.
        // If our .swift and .xib files were named differently we would need to provide the .xib file name here.
        // Note: The bundle for this class must be specified! We often pass in nil for the bundle argument assuming that the main bundle will work. However passing in nil here will result in the storyboard layout engine crashing because apparently it does not use the main bundle?
        let bundle = Bundle(for: type(of: self))
        let nibName = String(describing: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        
        // Get the root view defined in the xib.
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return view
    }
}
