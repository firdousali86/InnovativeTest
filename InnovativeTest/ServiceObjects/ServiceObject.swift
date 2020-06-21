//
//  FeedItem.swift
//  EremNews
//
//  Created by Firdous Ali on 21/03/2018.
//  Copyright © 2018 Firdous Ali. All rights reserved.
//

import Foundation

@objc public class ServiceObject : NSObject{
    var token:String?;
      
    public func setObjectData(_ serviceDict : NSDictionary){
        self.token = serviceDict.object(forKey: "token") as? String
    }
}
