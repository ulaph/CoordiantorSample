import UIKit

enum DetailThreeViewRoute: Route {
    case none
    case detailTwo
    case detailThree
}

protocol DetailThreeTransition {
    var route: DetailThreeViewRoute? { get }
}

final class DetailThreeViewCoordinator: Coordinator, DetailThreeTransition {
    private let navigator: UINavigationController
    private let image: UIImage?
    let route: DetailThreeViewRoute?

    init(_ navigator: UINavigationController, image: UIImage?, route: DetailThreeViewRoute? = nil) {
        self.navigator = navigator
        self.image = image
        self.route = route
    }

    func start() {
        let storyboard = UIStoryboard(name: DetailThreeViewController.className, bundle: nil)
        guard let viewController = storyboard.instantiateInitialViewController(creator: { coder in
            return DetailThreeViewController.init(coder: coder, transition: self, image: self.image)
        }) else {
            fatalError()
        }
        navigator.pushViewController(viewController, animated: true)
    }
}
