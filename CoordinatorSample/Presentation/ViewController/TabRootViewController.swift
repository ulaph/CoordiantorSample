import UIKit

class TabRootViewController: UIViewController {
    func setupTabBarItem(title: String, image: UIImage?, selectedImage: UIImage?) {
        self.tabBarItem = UITabBarItem(title: title, image: image, selectedImage: selectedImage)
    }
}
