//
//  RoundRectButton.swift
//  InnovativeTest
//
//  Created by Digital Dividend on 6/20/20.
//  Copyright © 2020 Firdous Ali. All rights reserved.
//

import Foundation
import UIKit

class RoundRectButton: UIButton {

//    var selectedState: Bool = false

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        layer.borderWidth = 2 / UIScreen.main.nativeScale
//        layer.borderColor = UIColor.white.cgColor
////        contentEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
//    }


    override func layoutSubviews(){
        super.layoutSubviews()
        layer.cornerRadius = 5 //frame.height / 2
//        backgroundColor = selectedState ? UIColor.white : UIColor.clear
//        self.titleLabel?.textColor = selectedState ? UIColor.green : UIColor.white
    }

//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        selectedState = !selectedState
//        self.layoutSubviews()
//    }
}
