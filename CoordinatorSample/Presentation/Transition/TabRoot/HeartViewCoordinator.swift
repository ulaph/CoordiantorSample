import UIKit

enum HeartViewRoute: Route {
    case none
    case detailOne(DetailOneViewRoute)
}

protocol HeartViewTransition {
    var route: HeartViewRoute? { get }
    func toDetailOneView(image: UIImage?, route: DetailOneViewRoute?)
}

extension HeartViewTransition {
    func toDetailOneView(image: UIImage?) {
        toDetailOneView(image: image, route: nil)
    }
}

final class HeartViewCoordinator: TabRootCoordinator, HeartViewTransition {
    private var navigator: UINavigationController!
    let route: HeartViewRoute?

    init(_ route: HeartViewRoute? = nil) {
        self.route = route
    }

    func start() -> UINavigationController {
        let storyboard = UIStoryboard(name: HeartViewController.className, bundle: nil)
        guard let viewController = storyboard.instantiateInitialViewController(creator: { coder in
            return HeartViewController.init(coder: coder, transition: self)
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
