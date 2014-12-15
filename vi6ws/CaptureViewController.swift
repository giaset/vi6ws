//
//  CaptureViewController.swift
//  vi6ws
//
//  Created by Gianni Settino on 2014-12-14.
//  Copyright (c) 2014 Milton and Parc. All rights reserved.
//

import UIKit

class CaptureViewController: UIViewController {

    var captureControlsView: CaptureControlsView?
    var captureView: CaptureView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        captureControlsView = CaptureControlsView(frame: view.frame)
        view.addSubview(captureControlsView!)
        
        captureView = CaptureView(frame: CGRect(x: 0, y: 44, width: view.frame.size.width, height: view.frame.size.width))
        view.addSubview(captureView!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        UIApplication.sharedApplication().statusBarHidden = true
    }
    
}

