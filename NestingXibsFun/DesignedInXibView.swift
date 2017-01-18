import UIKit

@IBDesignable
class DesignedInXibView: UIView,
    DesignedInXibAndNestableInOtherXibsViewProtocol
{
    // MARK: - DesignedInXibAndNestableInOtherXibsViewProtocol
    
    var viewFromXib: UIView!
    
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
        setupViewFromXib()
        
        titleLabel.textColor = .purple
    }
}
