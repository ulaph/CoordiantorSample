import UIKit

enum ClubViewRoute: Route {
    case none
    case detailTwo(DetailTwoViewRoute)
}

protocol ClubViewTransition {
    var route: ClubViewRoute? { get }
    func toDetailTwoView(image: UIImage?, route: DetailTwoViewRoute?)
}

extension ClubViewTransition {
    func toDetailTwoView(image: UIImage?) {
        toDetailTwoView(image: image, route: nil)
    }
}

final class ClubViewCoordinator: TabRootCoordinator, ClubViewTransition {
    private var navigator: UINavigationController!
    let route: ClubViewRoute?

    init(_ route: ClubViewRoute? = nil) {
        self.route = route
    }

    func start() -> UINavigationController {
        let storyboard = UIStoryboard(name: ClubViewController.className, bundle: nil)
        guard let viewController = storyboard.instantiateInitialViewController(creator: { coder in
            return ClubViewController.init(coder: coder, transition: self)
        }) else {
            fatalError()
        }

        self.navigator = UINavigationController(rootViewController: viewController)
        return self.navigator
    }

    func toDetailTwoView(image: UIImage?, route: DetailTwoViewRoute? = nil) {
        let coordinator = DetailTwoViewCoordinator(navigator, image: image, route: route)
        coordinate(to: coordinator)
    }
}
