import UIKit

protocol ClassNameProtocol {
    static var className: String { get }
}

extension NSObject: ClassNameProtocol {
    static var className: String {
        return String(describing: self)
    }
}
