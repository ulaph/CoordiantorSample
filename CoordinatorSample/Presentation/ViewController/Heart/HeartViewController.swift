import UIKit

final class HeartViewController: TabRootViewController {
    private let transition: HeartViewTransition

    init?(coder: NSCoder, transition: HeartViewTransition) {
        self.transition = transition

        super.init(coder: coder)
        super.setupTabBarItem(
            title: "Heart",
            image: UIImage(systemName: "suit.heart"),
            selectedImage: UIImage(systemName: "suit.heart.fill"))
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
            case .detailOne(let detailOneRoute):
                transition.toDetailOneView(
                    image: UIImage(systemName: "suit.heart.fill"),
                    route: detailOneRoute)
            }
        }
    }

    @IBAction func transitionToDetailOne(_ sender: Any) {
        transition.toDetailOneView(image: UIImage(systemName: "suit.heart.fill"))
    }
}
