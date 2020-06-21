//
//  Item.swift
//  InnovativeTest
//
//  Created by Digital Dividend on 6/21/20.
//  Copyright © 2020 Firdous Ali. All rights reserved.
//

import Foundation

@objc public class Item : NSObject{
    var id:Int?;
    var name:String?;
    var desc:String?;
    var price:Float?;
    var itemRate:Float?;
      
    public func setObjectData(_ serviceDict : NSDictionary){
        self.id = serviceDict.object(forKey: "id") as? Int
        self.name = serviceDict.object(forKey: "name") as? String
        self.desc = serviceDict.object(forKey: "description") as? String
        self.price = serviceDict.object(forKey: "price") as? Float
        self.itemRate = serviceDict.object(forKey: "itemRate") as? Float
    }
}

