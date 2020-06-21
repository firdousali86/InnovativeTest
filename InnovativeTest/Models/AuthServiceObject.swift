//
//  AuthServiceObject.swift
//  InnovativeTest
//
//  Created by Digital Dividend on 6/21/20.
//  Copyright © 2020 Firdous Ali. All rights reserved.
//

import Foundation

@objc public class AuthServiceObject : NSObject{
    var token:String?;
      
    public func setObjectData(_ serviceDict : NSDictionary){
        self.token = serviceDict.object(forKey: "token") as? String
    }
}
