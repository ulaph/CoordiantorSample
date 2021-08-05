import UIKit

enum DiamondViewRoute: Route {
    case none
    case detailOne(DetailOneViewRoute)
}

protocol DiamondViewTransition {
    var route: DiamondViewRoute? { get }
    func toDetailOneView(image: UIImage?, route: DetailOneViewRoute?)
}

extension DiamondViewTransition {
    func toDetailOneView(image: UIImage?) {
        toDetailOneView(image: image, route: nil)
    }
}

final class DiamondViewCoordinator: TabRootCoordinator, DiamondViewTransition {
    private var navigator: UINavigationController!
    let route: DiamondViewRoute?

    init(_ route: DiamondViewRoute? = nil) {
        self.route = route
    }

    func start() -> UINavigationController {
        let storyboard = UIStoryboard(name: DiamondViewController.className, bundle: nil)
        guard let viewController = storyboard.instantiateInitialViewController(creator: { coder in
            return DiamondViewController.init(coder: coder, transition: self)
        }) else {
            fatalError()
        }

        self.navigator = UINavigationController(rootViewController: viewController)
        return self.navigator
    }

    func toDetailOneView(image: UIImage?, route: DetailOneViewRoute? = nil) {
        let coordinator = DetailOneViewCoordinator(navigator, image: image, route: route)
        coordinate(to: coordinator)
    }
}
