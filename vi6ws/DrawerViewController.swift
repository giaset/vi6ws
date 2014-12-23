//
//  DrawerViewController.swift
//  vi6ws
//
//  Created by Gianni Settino on 2014-12-23.
//  Copyright (c) 2014 Milton and Parc. All rights reserved.
//

import UIKit

class DrawerViewController: UIViewController {
    
    var drawerView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawerView = DrawerView(frame: view.frame)
        view.addSubview(drawerView!)
    }
    
}
