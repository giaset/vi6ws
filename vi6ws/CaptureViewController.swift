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
    var flashView: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        captureControlsView = CaptureControlsView(frame: view.frame)
        view.addSubview(captureControlsView!)
        
        captureView = CaptureView(frame: CGRect(x: 0, y: 44, width: view.frame.size.width, height: view.frame.size.width))
        view.addSubview(captureView!)
        
        captureControlsView?.recordButton?.addTarget(self, action: "flash", forControlEvents: .TouchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        UIApplication.sharedApplication().statusBarHidden = true
        
        setupFlashView()
    }
    
    func setupFlashView() {
        flashView = UIView(frame: view.frame)
        flashView?.backgroundColor = UIColor.whiteColor()
        flashView?.hidden = true
        flashView?.alpha = 0
        view.addSubview(flashView!)
    }
    
    func flash() {
        flashView?.hidden = false
        
        UIView.animateWithDuration(0.15, animations: {
            self.flashView!.alpha = 1
            }, completion: {
                didFinish in
                UIView.animateWithDuration(0.15, animations: {
                    self.flashView!.alpha = 0
                    }, completion: {
                        didFinish in
                        self.flashView!.hidden = true
                })
        })
    }
    
}

