//
//  AppDelegate.swift
//  testovoe1
//
//  Created by Дина Черных on 27.06.23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navController = UINavigationController(rootViewController: MainViewController())
        if #available(iOS 13.0, *) {
            navController.navigationBar.scrollEdgeAppearance = navController.navigationBar.standardAppearance
        }
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        
        return true
    }
}

