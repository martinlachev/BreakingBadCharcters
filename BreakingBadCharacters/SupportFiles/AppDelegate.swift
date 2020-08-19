//
//  AppDelegate.swift
//  BreakingBadCharecters
//
//  Created by Marto Lachev on 29.07.20.
//  Copyright © 2020 Marto Lachev. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var coordinator: MainCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let navbarController = createNavBarController()
        
        coordinator = MainCoordinator(navigationController: navbarController)
        coordinator?.start()
        
        window = UIWindow(frame: UIScreen.main.bounds)
//        let homeStoryboard = UIStoryboard(name: "Characters", bundle: nil)
//        let homeVC = homeStoryboard.instantiateViewController(withIdentifier: "Characters")
        window?.rootViewController = navbarController
        window?.makeKeyAndVisible()
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

extension AppDelegate {
    func createNavBarController() ->  UINavigationController {
        let navController = UINavigationController()
        
        return navController
    }
}

