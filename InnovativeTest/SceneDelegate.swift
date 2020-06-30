//
//  SceneDelegate.swift
//  InnovativeTest
//
//  Created by Digital Dividend on 6/20/20.
//  Copyright © 2020 Firdous Ali. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    static let sharedInstance = SceneDelegate()
    
    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
        
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)

        let rootViewController:UIViewController;
        
        if(UserDefaultsHelper.sharedInstance.getToken() != nil){
            rootViewController = (mainStoryboard.instantiateViewController(withIdentifier: "dashboard") as? UIViewController)!
        }else{
            rootViewController = (mainStoryboard.instantiateViewController(withIdentifier: "login") as? UIViewController)!
        }

        window.rootViewController = rootViewController
        self.window = window
        window.makeKeyAndVisible()
        }
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    
    func logoutOnSessionExpire(){
        let rootViewController:UIViewController;
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        rootViewController = (mainStoryboard.instantiateViewController(withIdentifier: "login") as? UIViewController)!
        
        self.window?.rootViewController = rootViewController
    }
    
    func presentController(parentVC:UIViewController, viewIdentified:String){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newController = storyBoard.instantiateViewController(withIdentifier: viewIdentified) as! DashboardController
        newController.modalPresentationStyle = .fullScreen
        parentVC.present(newController, animated: true, completion: nil)
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

