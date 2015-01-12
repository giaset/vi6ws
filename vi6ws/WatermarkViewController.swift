//
//  WatermarkViewController.swift
//  vi6ws
//
//  Created by Gianni Settino on 2014-12-29.
//  Copyright (c) 2014 Milton and Parc. All rights reserved.
//

import UIKit

class WatermarkViewController: UIViewController {
    
    var watermarkView: WatermarkView?
    var exportView: ExportView?
    
    var image: UIImage
    
    required init(coder aDecoder: NSCoder) {
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
        view.addSubview(watermarkView!)
        
        let exportViewHeight = view.frame.height-44-view.frame.width
        exportView = ExportView(frame: CGRect(x: 0, y: view.frame.height, width: view.frame.width, height: exportViewHeight))
        view.addSubview(exportView!)
        
        watermarkView!.backButton.addTarget(self, action: "backButtonPressed", forControlEvents: .TouchUpInside)
        watermarkView!.exportButton.addTarget(self, action: "exportButtonPressed", forControlEvents: .TouchUpInside)
    }
    
    func backButtonPressed() {
        navigationController!.popViewControllerAnimated(true)
    }
    
    func exportButtonPressed() {
        UIView.animateWithDuration(0.3, animations: {
            self.exportView!.frame.origin.y = self.view.frame.height-self.exportView!.frame.height
            self.watermarkView!.backButton.enabled = false
            self.watermarkView!.backButton.alpha = 0.3
            self.watermarkView!.exportButton.enabled = false
            self.watermarkView!.exportButton.alpha = 0.3
        })
        
        /*SVProgressHUD.show()
        
        UIGraphicsBeginImageContextWithOptions(watermarkView!.imageView.bounds.size, true, 0.0)
        watermarkView!.imageView.drawViewHierarchyInRect(watermarkView!.imageView.bounds, afterScreenUpdates: true)
        var img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        UIImageWriteToSavedPhotosAlbum(img, self, "image:didFinishSavingWithError:contextInfo:", nil)*/
    }
    
    func image(image: UIImage, didFinishSavingWithError error: NSError, contextInfo:UnsafePointer<Void>) {
        SVProgressHUD.showSuccessWithStatus("Successfully exported image")
    }
    
}
