import UIKit

enum LaunchType {
    case normal
    case deeplink(Deeplink)
}

final class AppCoordinator: Coordinator {
    private let window: UIWindow
    private let launchType: LaunchType

    init(_ window: UIWindow, launchType: LaunchType) {
        self.window = window
        self.launchType = launchType
    }

    func start() {
        defer {
            self.window.makeKeyAndVisible()
        }

        let mainViewCoordinator = MainViewCoordinator(self.window, launchType: launchType)
        coordinate(to: mainViewCoordinator)
    }
}
