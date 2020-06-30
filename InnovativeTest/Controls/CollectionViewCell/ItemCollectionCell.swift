//
//  ItemCollectionCell.swift
//  InnovativeTest
//
//  Created by Digital Dividend on 6/21/20.
//  Copyright © 2020 Firdous Ali. All rights reserved.
//

import UIKit

class ItemCollectionCell: UICollectionViewCell {

    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.updateUI()
    }

    func updateUI(){

    }
}
