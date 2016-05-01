//
//  WatermarkViewController.swift
//  vi6ws
//
//  Created by Gianni Settino on 2014-12-29.
//  Copyright (c) 2014 Milton and Parc. All rights reserved.
//

import SVProgressHUD
import Social

class WatermarkViewController: UIViewController {
    
    var watermarkView: WatermarkView?
    var exportView: ExportView?
    
    var image: UIImage
    
    var documentInteractionController: UIDocumentInteractionController?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(image: UIImage) {
        self.image = image
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        watermarkView = WatermarkView(frame: view.frame)
        watermarkView!.imageView.image = image
        watermarkView!.imageView.backgroundColor = UIColor.blackColor()
        watermarkView!.imageView.contentMode = .ScaleAspectFit
        view.addSubview(watermarkView!)
        
        let exportViewHeight = view.frame.height/2
        exportView = ExportView(frame: CGRect(x: 0, y: view.frame.height, width: view.frame.width, height: exportViewHeight))
        view.addSubview(exportView!)
        
        watermarkView!.backButton.addTarget(self, action: #selector(backButtonPressed), forControlEvents: .TouchUpInside)
        watermarkView!.exportButton.addTarget(self, action: #selector(exportButtonPressed), forControlEvents: .TouchUpInside)
        
        exportView!.closeButton.addTarget(self, action: #selector(closeButtonPressed), forControlEvents: .TouchUpInside)
        exportView!.cameraRollButton.addTarget(self, action: #selector(cameraRollButtonPressed), forControlEvents: .TouchUpInside)
        exportView!.instagramButton.addTarget(self, action: #selector(instagramButtonPressed), forControlEvents: .TouchUpInside)
        exportView!.facebookButton.addTarget(self, action: #selector(facebookButtonPressed), forControlEvents: .TouchUpInside)
        exportView!.twitterButton.addTarget(self, action: #selector(twitterButtonPressed), forControlEvents: .TouchUpInside)
    }
    
    func backButtonPressed() {
        navigationController!.popViewControllerAnimated(true)
    }
    
    func exportButtonPressed() {
        UIView.animateWithDuration(0.3, delay: 0, options: .CurveEaseOut,
            animations: {
                self.exportView!.frame.origin.y = self.view.frame.height-self.exportView!.frame.height
            }, completion: nil)
        
        self.watermarkView!.backButton.enabled = false
        self.watermarkView!.backButton.alpha = 0.3
        self.watermarkView!.exportButton.enabled = false
        self.watermarkView!.exportButton.alpha = 0.3
        
        self.watermarkView!.watermarkView.userInteractionEnabled = false
    }
    
    func generateImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(watermarkView!.imageView.bounds.size, true, 0.0)
        watermarkView!.imageView.drawViewHierarchyInRect(watermarkView!.imageView.bounds, afterScreenUpdates: true)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return img
    }
    
    func closeButtonPressed() {
        UIView.animateWithDuration(0.3, delay: 0, options: .CurveEaseOut,
            animations: {
                self.exportView!.frame.origin.y = self.view.frame.height
            }, completion: nil)
        
        self.watermarkView!.backButton.enabled = true
        self.watermarkView!.backButton.alpha = 1
        self.watermarkView!.exportButton.enabled = true
        self.watermarkView!.exportButton.alpha = 1
        
        self.watermarkView!.watermarkView.userInteractionEnabled = true
    }
    
    func image(image: UIImage, didFinishSavingWithError error: NSError, contextInfo: UnsafePointer<Void>) {
        SVProgressHUD.showSuccessWithStatus("Successfully saved image to camera roll")
    }
    
    func cameraRollButtonPressed() {
        SVProgressHUD.show()
        
        let img = generateImage()
        
        UIImageWriteToSavedPhotosAlbum(img, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    func instagramButtonPressed() {
        if UIApplication.sharedApplication().canOpenURL(NSURL(string: "instagram://")!) {
            let savePath = (NSHomeDirectory() as NSString).stringByAppendingPathComponent("Documents/image.igo")
            
            let img = generateImage()
            
            UIImageJPEGRepresentation(img, 1.0)?.writeToFile(savePath, atomically: true)
            
            let instagramImageHookFile = NSURL(string: "file://"+savePath)
            
            documentInteractionController = UIDocumentInteractionController(URL: instagramImageHookFile!)
            documentInteractionController!.UTI = "com.instagram.exclusivegram"
            documentInteractionController!.annotation = [ "InstagramCaption": "#VI6WS" ]
            
            documentInteractionController!.presentOpenInMenuFromRect(CGRectZero, inView: view, animated: true)
        }
    }
    
    func facebookButtonPressed() {
        showComposeViewControllerForServiceType(SLServiceTypeFacebook)
    }
    
    func twitterButtonPressed() {
        showComposeViewControllerForServiceType(SLServiceTypeTwitter)
    }
    
    func showComposeViewControllerForServiceType(serviceType: String) {
        let img = generateImage()
        let composeVC = SLComposeViewController(forServiceType: serviceType)
        composeVC.addImage(img)
        composeVC.setInitialText("#VI6WS")
        composeVC.completionHandler = {
            (result: SLComposeViewControllerResult) in
            if result == .Cancelled {
                SVProgressHUD.showErrorWithStatus("Sharing cancelled")
            } else if result == .Done {
                SVProgressHUD.showSuccessWithStatus("Image shared successfully")
            }
        }
        presentViewController(composeVC, animated: true, completion: nil)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
}
