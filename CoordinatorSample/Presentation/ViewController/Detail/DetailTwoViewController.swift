import UIKit

final class DetailTwoViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!

    private let transition: DetailTwoTransition
    private let image: UIImage?

    init?(coder: NSCoder, transition: DetailTwoTransition, image: UIImage?) {
        self.transition = transition
        self.image = image

        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.imageView.image = image
    }
}
