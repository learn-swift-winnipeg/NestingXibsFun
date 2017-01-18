import UIKit

@IBDesignable
class AnotherDesignedInXibView: UIView,
    DesignedInXibAndNestableInOtherXibsViewProtocol
{
    // MARK: - DesignedInXibAndNestableInOtherXibsViewProtocol
    
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
