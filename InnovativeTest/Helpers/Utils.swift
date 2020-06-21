//
//  Utils.swift
//  InnovativeTest
//
//  Created by Digital Dividend on 6/21/20.
//  Copyright © 2020 Firdous Ali. All rights reserved.
//

import UIKit

class Utils: NSObject {
    
    
    static func getScreenWidth()->CGFloat{
        return UIScreen.main.bounds.width
    }
    
    static func getScreenHeight()->CGFloat{
        return UIScreen.main.bounds.height
    }
    
    static func isStringEmptyOrNull(strToCheck:String)->Bool{
        if(strToCheck == nil || strToCheck.count == 0){
            return true
        }
        
        return false
    }
}
