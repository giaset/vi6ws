//
//  CaptureViewController.swift
//  vi6ws
//
//  Created by Gianni Settino on 2014-12-14.
//  Copyright (c) 2014 Milton and Parc. All rights reserved.
//

import UIKit
import AVFoundation

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
        
        captureControlsView?.recordButton?.addTarget(self, action: "recordButtonPressed", forControlEvents: .TouchUpInside)
        
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
    
    func recordButtonPressed() {
        flash()
        
        var imageOutput = captureView!.imageOutput!
        
        var connection = imageOutput.connectionWithMediaType(AVMediaTypeVideo)
        if (connection.supportsVideoOrientation) {
            connection.videoOrientation = currentVideoOrientation()
        }
        
        imageOutput.captureStillImageAsynchronouslyFromConnection(connection, completionHandler: { (sampleBuffer: CMSampleBuffer!, error: NSError!) -> Void in
            if (sampleBuffer != nil) {
                let imageData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(sampleBuffer)
                let image = UIImage(data: imageData)
                
                println(self.captureControlsView!.statusBarHeight)
                println(self.view.frame.size.height)
                var percentageHiddenByNavBar = self.captureControlsView!.statusBarHeight/self.view.frame.size.height
                println(percentageHiddenByNavBar)
                var rect = CGRect(x: 0, y: percentageHiddenByNavBar*image!.size.height, width: image!.size.width, height: image!.size.width)
                println(rect)
                var imageRef = CGImageCreateWithImageInRect(image!.CGImage, rect)
                var croppedImage = UIImage(CGImage: imageRef, scale: image!.scale, orientation: image!.imageOrientation)
                
                self.navigationController!.pushViewController(WatermarkViewController(image: croppedImage!), animated: true)
            }
        })
    }
    
    func currentVideoOrientation() -> AVCaptureVideoOrientation {
        let deviceOrientation = UIDevice.currentDevice().orientation
        var videoOrientation: AVCaptureVideoOrientation
        
        switch (deviceOrientation) {
        case .PortraitUpsideDown:
            videoOrientation = .PortraitUpsideDown
            break
            
        case .LandscapeLeft:
            videoOrientation = .LandscapeRight
            break
            
        case .LandscapeRight:
            videoOrientation = .LandscapeLeft
            
        default:
            videoOrientation = .Portrait
        }
        
        return videoOrientation
    }
    
}

