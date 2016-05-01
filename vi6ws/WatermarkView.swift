//
//  WatermarkView.swift
//  vi6ws
//
//  Created by Gianni Settino on 2014-12-29.
//  Copyright (c) 2014 Milton and Parc. All rights reserved.
//

import UIKit

class WatermarkView: UIView, UIGestureRecognizerDelegate {
    
    var backgroundView = UIImageView()
    let imageView = UIImageView()
    let backButton = UIButton()
    let exportButton = UIButton()
    
    let watermarkView = UIImageView()
    
    let pickerView: WatermarkPickerView?
    
    let statusBarHeight: CGFloat = 44
    let padding: CGFloat = 15
    
    var lastCenter = CGPointZero
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        pickerView = WatermarkPickerView(frame: CGRectZero)
        
        super.init(frame: frame)
        
        backgroundView = UIImageView(image: UIImage(named: "marble"))
        addSubview(backgroundView)
        
        imageView.userInteractionEnabled = true
        imageView.clipsToBounds = true
        addSubview(imageView)
        
        watermarkView.userInteractionEnabled = true
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        pan.delegate = self
        watermarkView.addGestureRecognizer(pan)
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(_:)))
        pinch.delegate = self
        imageView.addGestureRecognizer(pinch)
        
        let rotate = UIRotationGestureRecognizer(target: self, action: #selector(handleRotation(_:)))
        rotate.delegate = self
        imageView.addGestureRecognizer(rotate)
        
        imageView.addSubview(watermarkView)
        
        backButton.setTitle("BACK", forState: .Normal)
        backButton.titleLabel!.font = UIFont(name: "FuturaBT-Heavy", size: 16)
        backButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        backButton.setTitleColor(UIColor.whiteColor(), forState: .Highlighted)
        addSubview(backButton)
        
        exportButton.setTitle("EXPORT", forState: .Normal)
        exportButton.titleLabel!.font = UIFont(name: "FuturaBT-Heavy", size: 16)
        exportButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        exportButton.setTitleColor(UIColor.whiteColor(), forState: .Highlighted)
        addSubview(exportButton)
        
        addSubview(pickerView!)
        
        pickerView!.pickedImageClosure = { image in
            self.watermarkView.image = image
            self.watermarkView.transform = CGAffineTransformIdentity // must reset the transform
            
            let imageViewSize = self.imageView.frame.size
            let imageSize = image.size
            
            var watermarkSize = image.size
            
            if imageSize.width > imageViewSize.width || imageSize.height > imageViewSize.height {
                let widthRatio = imageViewSize.width/imageSize.width
                let heightRatio = imageViewSize.height/imageSize.height
                
                let scale = min(widthRatio, heightRatio)
                
                watermarkSize = CGSize(width: watermarkSize.width*scale, height: watermarkSize.height*scale)
            }
            
            self.watermarkView.frame = CGRect(x: 0, y: 0, width: watermarkSize.width, height: watermarkSize.height)
            self.watermarkView.center = CGPoint(x: self.imageView.bounds.size.width/2, y: self.imageView.bounds.size.height/2)
            self.lastCenter = self.watermarkView.center
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundView.frame = frame
        
        imageView.frame = CGRect(x: 0, y: statusBarHeight, width: frame.size.width, height: frame.size.width)
        
        let startingY = CGRectGetMaxY(imageView.frame)
        pickerView?.frame = CGRect(x: 0, y: startingY, width: frame.size.width, height: frame.size.height-startingY)
        
        backButton.sizeToFit()
        backButton.frame = CGRect(x: padding, y: 0, width: backButton.frame.size.width, height: backButton.frame.size.height)
        backButton.center.y = statusBarHeight*0.5
        
        exportButton.sizeToFit()
        exportButton.frame = CGRect(x: frame.size.width-padding-exportButton.frame.size.width, y: 0, width: exportButton.frame.size.width, height: exportButton.frame.size.height)
        exportButton.center.y = statusBarHeight*0.5
    }
    
    func handlePinch(recognizer: UIPinchGestureRecognizer) {
        watermarkView.transform = CGAffineTransformScale(watermarkView.transform, recognizer.scale, recognizer.scale)
        recognizer.scale = 1
    }
    
    func handlePan(recognizer: UIPanGestureRecognizer) {
        watermarkView.center = lastCenter + recognizer.translationInView(self)
        
        if recognizer.state == .Ended {
            lastCenter = watermarkView.center
        }
    }
    
    func handleRotation(recognizer: UIRotationGestureRecognizer) {
        watermarkView.transform = CGAffineTransformRotate(watermarkView.transform, recognizer.rotation)
        recognizer.rotation = 0
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
}
