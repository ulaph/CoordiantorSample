import UIKit

final class ClubViewController: TabRootViewController {
    private let transition: ClubViewTransition

    init?(coder: NSCoder, transition: ClubViewTransition) {
        self.transition = transition

        super.init(coder: coder)
        super.setupTabBarItem(
            title: "Club",
            image: UIImage(systemName: "suit.club"),
            selectedImage: UIImage(systemName: "suit.club.fill"))
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
            case .detailTwo(let detailTwoRoute):
                transition.toDetailTwoView(
                    image: UIImage(systemName: "suit.club.fill"),
                    route: detailTwoRoute)
            }
        }
    }

    @IBAction func transitionToDetailTwo(_ sender: Any) {
        transition.toDetailTwoView(image: UIImage(systemName: "suit.club.fill"))
    }
}
