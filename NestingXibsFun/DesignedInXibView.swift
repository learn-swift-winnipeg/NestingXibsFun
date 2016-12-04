import UIKit

@IBDesignable
class DesignedInXibView: DesignedInXibAndNestableInOtherXibsView {
    
    // MARK: - Outlets
    
    @IBOutlet var titleLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    // MARK: - Setup
    
    private func setupView() {
        titleLabel.textColor = .purple
    }
}
