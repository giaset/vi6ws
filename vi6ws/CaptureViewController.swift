//
//  CaptureViewController.swift
//  vi6ws
//
//  Created by Gianni Settino on 2014-12-14.
//  Copyright (c) 2014 Milton and Parc. All rights reserved.
//

import UIKit
import AVFoundation
import MobileCoreServices

class CaptureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var captureControlsView: CaptureControlsView?
    var captureView: CaptureView?
    var flashView: UIView?
    
    let imagePicker = ViewsImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        captureControlsView = CaptureControlsView(frame: view.frame)
        view.addSubview(captureControlsView!)
        
        captureView = CaptureView(frame: CGRect(x: 0, y: 44, width: view.frame.size.width, height: view.frame.size.width))
        view.addSubview(captureView!)
        
        captureControlsView?.recordButton?.addTarget(self, action: #selector(recordButtonPressed), forControlEvents: .TouchUpInside)
        
        captureControlsView!.hamburgerButton.addTarget(self, action: #selector(hamburgerButtonPressed), forControlEvents: .TouchUpInside)
        
        captureControlsView!.flipButton.addTarget(self, action: #selector(flipButtonPressed), forControlEvents: .TouchUpInside)
        captureControlsView!.flashButton.addTarget(self, action: #selector(flashButtonPressed), forControlEvents: .TouchUpInside)
        
        imagePicker.delegate = self
        imagePicker.sourceType = .PhotoLibrary
        imagePicker.allowsEditing = true
        imagePicker.mediaTypes = [kUTTypeImage as String]
        
        captureControlsView!.importButton.addTarget(self, action: #selector(importButtonPressed), forControlEvents: .TouchUpInside)
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
        let slidingVC = self.slidingViewController()
        
        if slidingVC.currentTopViewPosition == .Centered {
            slidingVC.anchorTopViewToRightAnimated(true)
        } else {
            slidingVC.resetTopViewAnimated(true)
        }
    }
    
    func flipButtonPressed() {
        var cameraPosition = captureView!.cameraPosition
        cameraPosition = (cameraPosition == .Front) ? .Back : .Front
        captureView?.cameraPosition = cameraPosition
    }
    
    func flashButtonPressed() {
        captureControlsView!.flashButton.selected = !captureControlsView!.flashButton.selected
        
        if let captureDevice = captureView!.captureDevice {
            let flashMode: AVCaptureFlashMode = (captureControlsView!.flashButton.selected) ? .On : .Off
            if captureDevice.isFlashModeSupported(flashMode) {
                do {
                    try captureDevice.lockForConfiguration()
                    captureDevice.flashMode = flashMode
                    captureDevice.unlockForConfiguration()
                } catch {}
            }
        }
    }
    
    func recordButtonPressed() {
        guard let imageOutput = captureView?.imageOutput else { return }
        
        let connection = imageOutput.connectionWithMediaType(AVMediaTypeVideo)
        if connection.supportsVideoOrientation {
            connection.videoOrientation = currentVideoOrientation()
        }
        
        view.userInteractionEnabled = false
        imageOutput.captureStillImageAsynchronouslyFromConnection(connection, completionHandler: { (sampleBuffer: CMSampleBuffer!, error: NSError!) -> Void in
            self.view.userInteractionEnabled = true
            
            if sampleBuffer != nil {
                let imageData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(sampleBuffer)
                let image = UIImage(data: imageData)
                
                let previewRect = self.captureView!.videoPreviewLayer!.metadataOutputRectOfInterestForRect(self.captureView!.videoPreviewLayer!.bounds)
                let imageWidth = CGFloat(CGImageGetWidth(image!.CGImage))
                let imageHeight = CGFloat(CGImageGetHeight(image!.CGImage))
                let cropRect = CGRect(x: previewRect.origin.x*imageWidth, y: previewRect.origin.y*imageHeight, width: previewRect.size.width*imageWidth, height: previewRect.size.height*imageHeight)
                
                if let imageRef = CGImageCreateWithImageInRect(image!.CGImage, cropRect) {
                    let croppedImage = UIImage(CGImage: imageRef, scale: image!.scale, orientation: image!.imageOrientation)
                    self.navigationController!.pushViewController(WatermarkViewController(image: croppedImage), animated: true)
                }
            }
        })
    }
    
    func currentVideoOrientation() -> AVCaptureVideoOrientation {
        let deviceOrientation = UIDevice.currentDevice().orientation
        var videoOrientation: AVCaptureVideoOrientation
        
        switch deviceOrientation {
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
    
    func importButtonPressed() {
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage
        let cropRect = info[UIImagePickerControllerCropRect]!.CGRectValue()
        
        if let image = editedImage {
            
            print(image.size)
            print(cropRect)
            
            dismissViewControllerAnimated(true, completion: {
                self.navigationController!.pushViewController(WatermarkViewController(image: image), animated: true)
            })
        } else {
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}

class ViewsImagePickerController: UIImagePickerController {
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
