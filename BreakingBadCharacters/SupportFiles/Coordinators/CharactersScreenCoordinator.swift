
import UIKit

class CharactersScreenCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    weak var parentCoordinator: MainCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = CharactersScreenViewController.instantiate(storyboardName: "Characters")
        vc.coordinator = self
        
        navigationController.navigationBar.barStyle = .black
        navigationController.pushViewController(vc, animated: true)
    }
}

