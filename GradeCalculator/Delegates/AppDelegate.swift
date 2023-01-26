//
//  AppDelegate.swift
//  GradeCalculator
//
//  Created by unicred on 13/01/23.
//

import UIKit

let defInt = Int(integerLiteral: 0)
let defString = String(stringLiteral: "")

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
        window?.rootViewController = UINavigationController(rootViewController: HomeViewController())
        
        return true
    }
}
