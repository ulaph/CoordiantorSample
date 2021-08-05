import UIKit

final class SpadeViewController: TabRootViewController {
    private let transition: SpadeViewTransition

    init?(coder: NSCoder, transition: SpadeViewTransition) {
        self.transition = transition

        super.init(coder: coder)
        super.setupTabBarItem(
            title: "Spade",
            image: UIImage(systemName: "suit.spade"),
            selectedImage: UIImage(systemName: "suit.spade.fill"))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if let route = transition.route {
            switch route {
            case .none:
                break
            case .detailThree(let detailThreeRoute):
                transition.toDetailThreeView(
                    image: UIImage(systemName: "suit.spade.fill"),
                    route: detailThreeRoute)
            }
        }
    }

    @IBAction func transitionToDetailThree(_ sender: Any) {
        transition.toDetailThreeView(image: UIImage(systemName: "suit.spade.fill"))
    }
}
