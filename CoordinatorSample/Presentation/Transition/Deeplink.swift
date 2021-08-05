import Foundation

typealias Deeplink = URL

enum HostType: String {
    case openDetailOne = "open_detail_one"
}

struct DeeplinkHandler {
    static func handle(_ deeplink: Deeplink) -> Route? {
        guard let host = deeplink.host,
              let hostType = HostType.init(rawValue: host) else {
            return nil
        }
        switch hostType {
        case .openDetailOne:
            return MainViewRoute.heart(.detailOne(.none))
        }
    }
}
