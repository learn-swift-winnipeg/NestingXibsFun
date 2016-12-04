import UIKit

class DesignedInXibAndNestableInOtherXibsView: UIView, DesignedInXibAndNestableInOtherXibsViewProtocol {
    
    // MARK: - Stored Properties
    
    var viewFromXib: UIView!
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViewFromXib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupViewFromXib()
    }
}
