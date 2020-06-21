//
//  DashboardController.swift
//  InnovativeTest
//
//  Created by Digital Dividend on 6/21/20.
//  Copyright © 2020 Firdous Ali. All rights reserved.
//

import UIKit

class DashboardController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var itemList:[Item] = []
    let cellReuseIdentifier = "cell"
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.allowsSelection = false;
        
        tableView?.register(UINib(nibName: "ItemListCell", bundle:nil),
                           forCellReuseIdentifier: cellReuseIdentifier)
        
        ServiceManager.getItemList(completionHandler: { (response) in
            let serviceObject = ServiceObject()
            serviceObject.setObjectData(response as! NSDictionary)
            
            self.itemList = serviceObject.itemList
            self.tableView.reloadData()
            
        }) { (error) in
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:ItemListCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! ItemListCell
        let itemRow : Item = self.itemList[indexPath.row] //self.itemList.object(at: indexPath.row) as! Item
        
        cell.itemName.text = itemRow.name
        cell.itemDesc.text = itemRow.desc
        cell.itemPrice.text =  NSString(format: "%.2f", itemRow.price!) as String
        
        
//        cell.testLabel.text = "test2"
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}
