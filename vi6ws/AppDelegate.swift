//
//  AppDelegate.swift
//  vi6ws
//
//  Created by Gianni Settino on 2014-12-14.
//  Copyright (c) 2014 Milton and Parc. All rights reserved.
//

import ECSlidingViewController

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var slidingViewController: ECSlidingViewController?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        let rootNavController = UINavigationController(rootViewController: CaptureViewController())
        
        let drawerViewController = DrawerViewController()
        
        slidingViewController = ECSlidingViewController(topViewController: rootNavController)
        slidingViewController?.underLeftViewController = drawerViewController
        
        window?.rootViewController = slidingViewController
        
        window?.makeKeyAndVisible()
        
        return true
    }

}

