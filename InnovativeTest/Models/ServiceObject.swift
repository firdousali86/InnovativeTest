//
//  ServiceObject.swift
//  InnovativeTest
//
//  Created by Digital Dividend on 6/21/20.
//  Copyright © 2020 Firdous Ali. All rights reserved.
//


import Foundation

@objc public class ServiceObject : NSObject{
    var token:String?;
    var itemList:[Item] = []
      
    public func setObjectData(_ serviceDict : NSDictionary){
        self.token = serviceDict.object(forKey: "token") as? String
        self.itemList = serviceDict.object(forKey: "itemList") as! [Item]
    }
}
