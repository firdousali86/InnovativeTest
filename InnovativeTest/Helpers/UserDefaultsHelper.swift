//
//  UserDefaultsHelper.swift
//  InnovativeTest
//
//  Created by Digital Dividend on 6/21/20.
//  Copyright © 2020 Firdous Ali. All rights reserved.
//

import Foundation

final class UserDefaultsHelper: NSObject {
    static let sharedInstance = UserDefaultsHelper()

    private override init() { }

    func getToken()->String? {
        if((UserDefaults.standard.string(forKey: Constants.Keys.kAccessToken)) != nil){
            return UserDefaults.standard.string(forKey: Constants.Keys.kAccessToken)
        }
        
        return nil
    }
    
    func setToken(token:String) {
        UserDefaults.standard.set(token, forKey: Constants.Keys.kAccessToken)
    }
}

