import UIKit

enum Tab: Int, CaseIterable {
    case heart = 0
    case club = 1
    case spade = 2
    case diamond = 3
}

final class MainViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
