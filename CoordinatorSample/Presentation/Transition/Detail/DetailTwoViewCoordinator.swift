import UIKit

enum DetailTwoViewRoute: Route {
    case none
    case detailTwo
    case detailThree
}

protocol DetailTwoTransition {
    var route: DetailTwoViewRoute? { get }
}

final class DetailTwoViewCoordinator: Coordinator, DetailTwoTransition {
    private let navigator: UINavigationController
    private let image: UIImage?
    let route: DetailTwoViewRoute?

    init(_ navigator: UINavigationController, image: UIImage?, route: DetailTwoViewRoute? = nil) {
        self.navigator = navigator
        self.image = image
        self.route = route
    }

    func start() {
        let storyboard = UIStoryboard(name: DetailTwoViewController.className, bundle: nil)
        guard let viewController = storyboard.instantiateInitialViewController(creator: { coder in
            return DetailTwoViewController.init(coder: coder, transition: self, image: self.image)
        }) else {
            fatalError()
        }
        navigator.pushViewController(viewController, animated: true)
    }
}
