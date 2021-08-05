import UIKit

protocol ClubViewTransition {
}

final class ClubViewCoordinator: TabRootCoordinator, ClubViewTransition {
    func start() -> UINavigationController {
        let storyboard = UIStoryboard(name: ClubViewController.className, bundle: nil)
        guard let viewController = storyboard.instantiateInitialViewController(creator: { coder in
            return ClubViewController.init(coder: coder, transition: self)
        }) else {
            fatalError()
        }
        return UINavigationController(rootViewController: viewController)
    }
}
