import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window

        let appCoordinator = AppCoordinator(window, launchType: .normal)
        appCoordinator.start()
        return true
    }

    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        guard let window = self.window else {
            return false
        }
        let appCoordinator = AppCoordinator(window, launchType: .deeplink(url))
        appCoordinator.start()
        return true
    }
}

