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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        captureControlsView = CaptureControlsView(frame: view.frame)
        view.addSubview(captureControlsView!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

