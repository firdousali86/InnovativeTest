//
//  DashboardController.swift
//  InnovativeTest
//
//  Created by Digital Dividend on 6/21/20.
//  Copyright © 2020 Firdous Ali. All rights reserved.
//

import UIKit

class DashboardController: UIViewController, UITableViewDelegate, UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate {

    var itemList:[Item] = []
    let cellReuseIdentifier = "cell"
    let collectionCellIdentifier = "collectionCell"
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.allowsSelection = false;
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        self.tableView?.register(UINib(nibName: "ItemListCell", bundle:nil),
                           forCellReuseIdentifier: cellReuseIdentifier)
        self.collectionView?.register(UINib(nibName: "ItemCollectionCell", bundle:nil),
                                      forCellWithReuseIdentifier: collectionCellIdentifier)
        
        ServiceManager.getItemList(completionHandler: { (response) in
            let serviceObject = ServiceObject()
            serviceObject.setObjectData(response as! NSDictionary)
            
            self.itemList = serviceObject.itemList
            self.tableView.reloadData()
            self.collectionView.reloadData()
            
        }) { (error) in
            
        }
    }
    
    //uitableview
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:ItemListCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! ItemListCell
        let itemRow : Item = self.itemList[indexPath.row] //self.itemList.object(at: indexPath.row) as! Item
        
        cell.itemName.text = itemRow.name
        cell.itemDesc.text = itemRow.desc
        cell.itemPrice.text = "Rs." +  (NSString(format: "%.2f", itemRow.price!) as String) as String
        
        
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
        return 140.0
    }
    
    //uicollectionview
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
      return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.itemList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
               let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellIdentifier, for: indexPath as IndexPath) as! ItemCollectionCell
               cell.backgroundColor = .black
        
        let itemRow : Item = self.itemList[indexPath.row]
        
        cell.itemName.text = itemRow.name
        cell.itemPrice.text = "Rs." +  (NSString(format: "%.2f", itemRow.price!) as String) as String
        
               // Use the outlet in our custom class to get a reference to the UILabel in the cell
//               cell.myLabel.text = self.items[indexPath.item]
//               cell.backgroundColor = UIColor.cyan // make cell more visible in our example project
               
               return cell
    }
}
