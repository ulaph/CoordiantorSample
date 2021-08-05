import UIKit

protocol TabRootCoordinator {
    func start() -> UINavigationController
    func coordinate(to coordinator: Coordinator)
}

extension TabRootCoordinator {
    func coordinate(to coordinator: Coordinator) {
        coordinator.start()
    }
}

protocol Coordinator {
    func start()
    func coordinate(to coordinator: Coordinator)
}

extension Coordinator {
    func coordinate(to coordinator: Coordinator) {
        coordinator.start()
    }
}
