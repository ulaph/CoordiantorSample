import UIKit

protocol SpadeViewTransition {
}

final class SpadeViewCoordinator: TabRootCoordinator, SpadeViewTransition {
    func start() -> UINavigationController {
        let storyboard = UIStoryboard(name: SpadeViewController.className, bundle: nil)
        guard let viewController = storyboard.instantiateInitialViewController(creator: { coder in
            return SpadeViewController.init(coder: coder, transition: self)
        }) else {
            fatalError()
        }
        return UINavigationController(rootViewController: viewController)
    }
}
