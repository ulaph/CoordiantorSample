import UIKit

enum MainViewRoute: Route {
    case heart(HeartViewRoute)
}

final class MainViewCoordinator: Coordinator {
    private let window: UIWindow
    private let launchType: LaunchType

    init(_ window: UIWindow, launchType: LaunchType) {
        self.window = window
        self.launchType = launchType
    }

    func start() {
        let mainViewController = MainViewController()
        switch launchType {
        case .normal:
            mainViewController.viewControllers = [
                HeartViewCoordinator().start(),
                ClubViewCoordinator().start(),
                SpadeViewCoordinator().start(),
                DiamondViewCoordinator().start()
            ]
        case .deeplink(let deeplink):
            var viewControllers: [UIViewController] = [
                HeartViewCoordinator().start(),
                ClubViewCoordinator().start(),
                SpadeViewCoordinator().start(),
                DiamondViewCoordinator().start()
            ]
            if let route = DeeplinkHandler.handle(deeplink) as? MainViewRoute {
                switch route {
                case .heart(let heartRoute):
                    viewControllers[Tab.heart.rawValue] = HeartViewCoordinator(heartRoute).start()
                }
            }
            mainViewController.viewControllers = viewControllers
        }

        self.window.rootViewController = mainViewController
    }
}
