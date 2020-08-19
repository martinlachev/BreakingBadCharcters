import UIKit

protocol Storyboarded {
    static func instantiate(storyboardName:String) -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate(storyboardName:String) -> Self {
        
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        let storyboard = UIStoryboard(name: storyboardName, bundle: .none)

        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
