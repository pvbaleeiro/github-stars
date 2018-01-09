//
//  AppDelegate.swift
//  GithubStars
//
//  Created by Victor Baleeiro on 16/12/17.
//  Copyright © 2017 Victor Baleeiro. All rights reserved.
//

import UIKit
import CoreData
import HockeySDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //Hockey config
        hockeySetup()
        
        //Splash screen
        splashSetup()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
    }
    
    // MARK: - Splash
    func splashSetup() {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let splashScreen = SplashRouter.assembleModule()
        window?.makeKeyAndVisible()
        window?.set(rootViewController: splashScreen)
    }

    func switchMainViewController(viewController: UIViewController) {
        window?.makeKeyAndVisible()
        window?.set(rootViewController: viewController)
    }
    
    //MARK: Hockey
    private enum Hockey: String {
        case identifier = "494ac6cf605549ba850d5e683b9f9cef"
    }
    
    func hockeySetup() {
        
        BITHockeyManager.shared().configure(withIdentifier: Hockey.identifier.rawValue)
        // Do some additional configuration if needed here
        BITHockeyManager.shared().start()
        BITHockeyManager.shared().authenticator.authenticateInstallation()
    }
}

