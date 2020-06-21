//
//  DashboardController.swift
//  InnovativeTest
//
//  Created by Digital Dividend on 6/21/20.
//  Copyright © 2020 Firdous Ali. All rights reserved.
//

import UIKit

class DashboardController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        ServiceManager.getItemList(completionHandler: { (response) in
            let serviceObject = ServiceObject()
            serviceObject.setObjectData(response as! NSDictionary)
            
            
        }) { (error) in
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
