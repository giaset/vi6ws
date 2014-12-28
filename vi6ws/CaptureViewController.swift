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
        
        captureControlsView!.hamburgerButton.addTarget(self, action: "hamburgerButtonPressed", forControlEvents: .TouchUpInside)
        
        captureControlsView!.flipButton.addTarget(self, action: "flipButtonPressed", forControlEvents: .TouchUpInside)
        captureControlsView!.flashButton.addTarget(self, action: "flashButtonPressed", forControlEvents: .TouchUpInside)
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
    
    func hamburgerButtonPressed() {
        var slidingVC = self.slidingViewController()
        
        if (slidingVC.currentTopViewPosition == .Centered) {
            slidingVC.anchorTopViewToRightAnimated(true)
        } else {
            slidingVC.resetTopViewAnimated(true)
        }
    }
    
    func flipButtonPressed() {
        var cameraPosition = captureView!.cameraPosition
        cameraPosition = (cameraPosition == .Front) ? .Back : .Front
        captureView!.setCameraPosition(cameraPosition)
    }
    
    func flashButtonPressed() {
        captureControlsView!.flashButton.selected = !captureControlsView!.flashButton.selected
    }
    
}

