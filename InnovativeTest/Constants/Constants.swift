import Foundation

struct Constants {

	struct Network {
        static let baseUrl = "http://94.206.102.22/app"
        static let AuthTokenName = "Authorization"
        static let SuccessCode = 200
        static let successRange = 200..<300
        static let Unauthorized = 401
        static let NotFoundCode = 404
        static let ServerError = 500
    }
    
    struct ServiceApis{
        static let kApiAuthenticate = "/authenticate"
        static let kApiGetUserlist = "/user-list"
        static let kApiGetItemList = "/item-list"
    }
    
    struct Keys{
        static let kAccessToken = "accessToken"
    }
    
    struct Formatters {
        
        static let debugConsoleDateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
            formatter.timeZone = TimeZone(identifier: "UTC")!
            return formatter
        }()
        
    }
    
    struct Debug {
        static let crashlytics = false
        static let jsonResponse = false
    }
}
