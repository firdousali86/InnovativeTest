//
//  ServiceManager.swift
//  InnovativeTest
//
//  Created by Digital Dividend on 6/20/20.
//  Copyright © 2020 Firdous Ali. All rights reserved.
//

import UIKit

class ServiceManager: NSObject {
    
    static func postLogin(username:String, password:String, completionHandler: @escaping CompletionHandler, errorHandler: @escaping ErrorHandler){
        HttpRequestManager.sharedInstance.post(path: Constants.ServiceApis.kApiAuthenticate, parameters: ["username": username,"password":password], completionHandler: { (response) in
            
            let responseDict = response as! NSDictionary
            
            if(responseDict["status"] != nil){
                let status = responseDict["status"] as! Int
                if(status == 401){
                    SceneDelegate.sharedInstance.logoutOnSessionExpire()
                    UserDefaultsHelper.sharedInstance.setToken(token: nil)
                    errorHandler(response)
                    return
                }
            }
            
            
            if(completionHandler != nil){
                completionHandler(response)
            }
        }) { (error) in
            if(errorHandler != nil){
                errorHandler(error)
            }
        }
    }
    
    static func getItemList(completionHandler: @escaping CompletionHandler, errorHandler: @escaping ErrorHandler){
        HttpRequestManager.sharedInstance.post(path: Constants.ServiceApis.kApiGetItemList, parameters: [:], completionHandler: { (response) in
            
            let responseDict = response as! NSDictionary
            
            if(responseDict["status"] != nil){
                let status = responseDict["status"] as! Int
                if(status == 401){
                    SceneDelegate.sharedInstance.logoutOnSessionExpire()
                    UserDefaultsHelper.sharedInstance.setToken(token: nil)
                    errorHandler(response)
                    return
                }
            }
            
            if(completionHandler != nil){
                completionHandler(response)
            }
        }) { (error) in
            if(errorHandler != nil){
                errorHandler(error)
            }
        }
    }
}
