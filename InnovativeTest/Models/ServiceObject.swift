//
//  ServiceObject.swift
//  InnovativeTest
//
//  Created by Digital Dividend on 6/21/20.
//  Copyright © 2020 Firdous Ali. All rights reserved.
//


import Foundation

@objc public class ServiceObject : NSObject{
    var itemList:[Item] = []
      
    public func setObjectData(_ serviceDict : NSDictionary){
        let records:NSArray? = (serviceDict.object(forKey: "itemList") as! [Item] as NSArray)
        var indexer = 0
        
        for record in records! {
            let itemObject = Item()
            itemObject.setObjectData(record as! NSDictionary)
            
            self.itemList.append(itemObject)
            indexer += 1
        }
        
    }
}
