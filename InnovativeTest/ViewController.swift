//
//  ViewController.swift
//  InnovativeTest
//
//  Created by Digital Dividend on 6/20/20.
//  Copyright © 2020 Firdous Ali. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    @IBAction func onEnterTap(){
        if(!Utils.isStringEmptyOrNull(strToCheck: self.userNameField.text!) && !Utils.isStringEmptyOrNull(strToCheck: self.passwordField.text!)){
            
            ServiceManager.postLogin(username: self.userNameField.text!, password: self.passwordField.text!, completionHandler: { (response) in
                let serviceObject = ServiceObject()
                serviceObject.setObjectData(response as! NSDictionary)
                
                UserDefaultsHelper.sharedInstance.setToken(token: serviceObject.token!)
            }) { (error) in
                
            }
        }
    }
}

