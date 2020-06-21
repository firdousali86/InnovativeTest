import UIKit
import Alamofire

typealias CompletionHandler = (_ success:Any) -> Void
typealias ErrorHandler = (_ error:Any) -> Void

@objc final class HttpRequestManager : NSObject{
    static let sharedInstance = HttpRequestManager()

    private override init(){}
    
    func post(path:String, parameters:[String: Any], completionHandler: @escaping CompletionHandler, errorHandler: @escaping ErrorHandler){
        
        var url : String;
        
        if path.lowercased().range(of:"http") != nil {
            url = path
        }else{
            url = Constants.Network.baseUrl + path
        }
        
        var headers: HTTPHeaders = [:]
        
        headers["Content-Type"] = "application/json"
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.init(options: []), headers: headers).response { (response) in

            let json = try? JSONSerialization.jsonObject(with: response.data!, options: [])

            if let dictionary = json as? [String: Any] {
                if(completionHandler != nil){
                    completionHandler(dictionary)
                }
            }
            else if let array = json as? [Any] {
                if(completionHandler != nil){
                    completionHandler(array)
                }
            }
            else{
                if(errorHandler != nil){
                    errorHandler(response.error)
                }
            }
        }
    }
    
    func get(path:String, parameters:[String: Any], completionHandler: @escaping CompletionHandler, errorHandler: @escaping ErrorHandler){
        
        var url : String;
        
        if path.lowercased().range(of:"http") != nil {
            url = path
        }else{
            url = Constants.Network.baseUrl + path
        }
        
        let user = "web"
        let password = "123456"
        
        var headers: HTTPHeaders = [:]
        
        if let authorizationHeader = Request.authorizationHeader(user: user, password: password) {
            headers[authorizationHeader.key] = authorizationHeader.value
        }
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).response { (response) in
            
            let json = try? JSONSerialization.jsonObject(with: response.data!, options: [])
            
            if let dictionary = json as? [String: Any] {
                if(completionHandler != nil){
                    completionHandler(dictionary)
                }
            }
            else if let array = json as? [Any] {
                if(completionHandler != nil){
                    completionHandler(array)
                }
            }
            else{
                if(errorHandler != nil){
                    errorHandler(response.error)
                }
            }
        }
    }
}
