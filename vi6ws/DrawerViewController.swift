//
//  DrawerViewController.swift
//  vi6ws
//
//  Created by Gianni Settino on 2014-12-23.
//  Copyright (c) 2014 Milton and Parc. All rights reserved.
//

import UIKit

class DrawerViewController: UIViewController {
    
    var drawerView: DrawerView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawerView = DrawerView(frame: view.frame)
        view.addSubview(drawerView!)
        
        drawerView!.websiteButton.addTarget(self, action: "websiteButtonPressed", forControlEvents: .TouchUpInside)
        drawerView!.aboutButton.addTarget(self, action: "aboutButtonPressed", forControlEvents: .TouchUpInside)
        drawerView!.helpButton.addTarget(self, action: "helpButtonPressed", forControlEvents: .TouchUpInside)
    }
    
    func websiteButtonPressed() {
        let url = NSURL(string: "http://www.vi6ws.com")
        UIApplication.sharedApplication().openURL(url!)
    }

    func aboutButtonPressed() {
        let aboutText = "'VI6WS' is a photography filter application that allows users the option to point-and-shoot or import pictures from their Photo Library in order to tag them with watermarks dedicated to the arts and culture of the city of Toronto, with the added possibility of directly sharing them to social media platforms such as Instagram, Facebook, and Twitter. The \"6\" is a diminutive of the city's area codes recently made popular by the city's biggest international star, Drake."
        
        presentVC(TextViewController(text: aboutText))
    }
    
    func helpButtonPressed() {
        let helpText = "Nuh time."
        
        presentVC(TextViewController(text: helpText))
    }
    
    func presentVC(vc: UIViewController) {
        var slidingVC = self.slidingViewController()
        
        var mainNavController = slidingVC.topViewController as UINavigationController
        
        slidingVC.resetTopViewAnimated(true, onComplete: {mainNavController.pushViewController(vc, animated: false)})
    }
    
}
