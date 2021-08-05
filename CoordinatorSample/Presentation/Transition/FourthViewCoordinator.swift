import UIKit

protocol DiamondViewTransition {
}

final class DiamondViewCoordinator: TabRootCoordinator, DiamondViewTransition {
    func start() -> UINavigationController {
        let storyboard = UIStoryboard(name: DiamondViewController.className, bundle: nil)
        guard let viewController = storyboard.instantiateInitialViewController(creator: { coder in
            return DiamondViewController.init(coder: coder, transition: self)
        }) else {
            fatalError()
        }
        return UINavigationController(rootViewController: viewController)
    }
}
