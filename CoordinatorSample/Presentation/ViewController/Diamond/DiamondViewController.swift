import UIKit

final class DiamondViewController: TabRootViewController {
    private let transition: DiamondViewTransition

    init?(coder: NSCoder, transition: DiamondViewTransition) {
        self.transition = transition

        super.init(coder: coder)
        super.setupTabBarItem(
            title: "Diamond",
            image: UIImage(systemName: "suit.diamond"),
            selectedImage: UIImage(systemName: "suit.diamond.fill"))
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
                    image: UIImage(systemName: "suit.diamond.fill"),
                    route: detailOneRoute)
            }
        }
    }

    @IBAction func openDetailOne(_ sender: Any) {
        guard let url = URL(string: "coordinator-sample://open_detail_one") else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
