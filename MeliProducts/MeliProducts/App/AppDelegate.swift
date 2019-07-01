//
//  AppDelegate.swift
//  MeliProducts
//
//  Created by matheus.feola on 29/06/19.
//  Copyright © 2019 matheus.feola. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        self.window?.rootViewController = ProductListViewController()
        
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

