import UIKit

protocol HeartViewTransition {
}

final class HeartViewCoordinator: TabRootCoordinator, HeartViewTransition {
    func start() -> UINavigationController {
        let storyboard = UIStoryboard(name: HeartViewController.className, bundle: nil)
        guard let viewController = storyboard.instantiateInitialViewController(creator: { coder in
            return HeartViewController.init(coder: coder, transition: self)
        }) else {
            fatalError()
        }
        return UINavigationController(rootViewController: viewController)
    }
}
