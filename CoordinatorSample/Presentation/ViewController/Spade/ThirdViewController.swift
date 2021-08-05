import UIKit

final class SpadeViewController: TabRootViewController {
    private let transition: ThirdViewTransition

    init?(coder: NSCoder, transition: ThirdViewTransition) {
        self.transition = transition
        
        super.init(coder: coder)
        super.setupTabBarItem(
            title: "Third",
            image: UIImage(systemName: "suit.spade"),
            selectedImage: UIImage(systemName: "suit.spade.fill"))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
