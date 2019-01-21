//
//  AppDelegate.swift
//  AsaKore
//
//  Created by Takumi Karibe on 2018/05/23.
//  Copyright © 2018年 Takumi Karibe. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        GADMobileAds.configure(withApplicationID: AdMobSettings.appId)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: TopViewController.instantiate())
        window?.makeKeyAndVisible()

        return true
    }
}
