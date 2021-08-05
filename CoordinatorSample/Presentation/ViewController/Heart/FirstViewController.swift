import UIKit

final class HeartViewController: TabRootViewController {
    private let transition: FirstViewTransition

    init?(coder: NSCoder, transition: FirstViewTransition) {
        self.transition = transition

        super.init(coder: coder)
        super.setupTabBarItem(
            title: "First",
            image: UIImage(systemName: "suit.heart"),
            selectedImage: UIImage(systemName: "suit.heart.fill"))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
