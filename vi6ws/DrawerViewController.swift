//
//  DrawerViewController.swift
//  vi6ws
//
//  Created by Gianni Settino on 2014-12-23.
//  Copyright (c) 2014 Milton and Parc. All rights reserved.
//

class DrawerViewController: UIViewController {
    
    private var drawerView: DrawerView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawerView = DrawerView(frame: view.frame)
        view.addSubview(drawerView!)
        
        drawerView!.aboutButton.addTarget(self, action: #selector(aboutButtonPressed), forControlEvents: .TouchUpInside)
        drawerView!.helpButton.addTarget(self, action: #selector(helpButtonPressed), forControlEvents: .TouchUpInside)
    }

    func aboutButtonPressed() {
        let aboutText = "'VI6WS' is a photography filter application that allows users the option to point-and-shoot or import pictures from their Photo Library in order to tag them with watermarks dedicated to the arts and culture of the city of Toronto, with the added possibility of directly sharing them to social media platforms such as Instagram, Facebook, and Twitter. The \"6\" is a diminutive of the city's area codes recently made popular by the city's biggest international star, Drake."
        
        presentVC(TextViewController(text: aboutText))
    }
    
    func helpButtonPressed() {
        let helpText = "All content including text, graphics, logos, and images, is the property of October’s Very Own and is protected by Canadian, United States and international copyright laws. “October’s Very Own” designs and OWL designs are trademarks of October’s Very Own IP Holdings used under license by October’s Very Own Merchandising."
        
        presentVC(TextViewController(text: helpText))
    }
    
    func presentVC(controller: UIViewController) {
        let slidingVC = slidingViewController()
        
        let mainNavController = slidingVC.topViewController as? UINavigationController
        
        slidingVC.resetTopViewAnimated(true, onComplete: {mainNavController?.pushViewController(controller, animated: false)})
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
}
