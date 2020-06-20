//
//  MainLabel.swift
//  InnovativeTest
//
//  Created by Digital Dividend on 6/20/20.
//  Copyright © 2020 Firdous Ali. All rights reserved.
//

import Foundation
import UIKit

class MainLabel:UILabel{
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.font = UIFont.systemFont(ofSize: 20, weight: .heavy) 
        self.textColor = UIColor.white
    }
}
