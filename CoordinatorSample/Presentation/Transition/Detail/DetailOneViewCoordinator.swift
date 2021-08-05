import UIKit

enum DetailOneViewRoute: Route {
    case none
    case detailTwo
    case detailThree
}

protocol DetailOneTransition {
    var route: DetailOneViewRoute? { get }
}

final class DetailOneViewCoordinator: Coordinator, DetailOneTransition {
    private let navigator: UINavigationController
    private let image: UIImage?
    let route: DetailOneViewRoute?

    init(_ navigator: UINavigationController, image: UIImage?, route: DetailOneViewRoute? = nil) {
        self.navigator = navigator
        self.image = image
        self.route = route
    }

    func start() {
        let storyboard = UIStoryboard(name: DetailOneViewController.className, bundle: nil)
        guard let viewController = storyboard.instantiateInitialViewController(creator: { coder in
            return DetailOneViewController.init(coder: coder, transition: self, image: self.image)
        }) else {
            fatalError()
        }
        navigator.pushViewController(viewController, animated: true)
    }
}
