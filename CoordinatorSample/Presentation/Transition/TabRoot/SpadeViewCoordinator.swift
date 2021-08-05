import UIKit

enum SpadeViewRoute: Route {
    case none
    case detailThree(DetailThreeViewRoute)
}

protocol SpadeViewTransition {
    var route: SpadeViewRoute? { get }
    func toDetailThreeView(image: UIImage?, route: DetailThreeViewRoute?)
}

extension SpadeViewTransition {
    func toDetailThreeView(image: UIImage?) {
        toDetailThreeView(image: image, route: nil)
    }
}

final class SpadeViewCoordinator: TabRootCoordinator, SpadeViewTransition {
    private var navigator: UINavigationController!
    let route: SpadeViewRoute?

    init(_ route: SpadeViewRoute? = nil) {
        self.route = route
    }

    func start() -> UINavigationController {
        let storyboard = UIStoryboard(name: SpadeViewController.className, bundle: nil)
        guard let viewController = storyboard.instantiateInitialViewController(creator: { coder in
            return SpadeViewController.init(coder: coder, transition: self)
        }) else {
            fatalError()
        }

        self.navigator = UINavigationController(rootViewController: viewController)
        return self.navigator
    }

    func toDetailThreeView(image: UIImage?, route: DetailThreeViewRoute? = nil) {
        let coordinator = DetailThreeViewCoordinator(navigator, image: image, route: route)
        coordinate(to: coordinator)
    }
}
