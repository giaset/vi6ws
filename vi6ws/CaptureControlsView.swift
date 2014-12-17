//
//  CaptureControlsView.swift
//  vi6ws
//
//  Created by Gianni Settino on 2014-12-14.
//  Copyright (c) 2014 Milton and Parc. All rights reserved.
//

import UIKit

class CaptureControlsView: UIView {
    
    var backgroundView: UIImageView?
    
    var recordButtonBackgroundView: UIView?
    var recordButton: UIButton?
    
    let statusBarHeight = 44
    let recordButtonRadius: CGFloat = 36
    let recordButtonBorderWidth: CGFloat = 8
    let padding: CGFloat = 15
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        backgroundView = UIImageView(image: UIImage(named: "marble"))
        addSubview(backgroundView!)
        
        recordButtonBackgroundView = UIView()
        recordButtonBackgroundView?.backgroundColor = UIColor.blackColor()
        recordButtonBackgroundView?.alpha = 0.2
        recordButtonBackgroundView?.layer.cornerRadius = recordButtonRadius+recordButtonBorderWidth
        addSubview(recordButtonBackgroundView!)
        
        recordButton = UIButton()
        recordButton?.setBackgroundImage(UIImage.imageWithColor(UIColor.blackColor()), forState: .Normal)
        recordButton?.setBackgroundImage(UIImage.imageWithColor(UIColor.redColor()), forState: .Highlighted)
        recordButton?.layer.cornerRadius = recordButtonRadius
        recordButton?.clipsToBounds = true
        addSubview(recordButton!)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundView?.frame = frame
        
        var recordButtonBackgroundViewRadius = recordButtonRadius+recordButtonBorderWidth
        recordButtonBackgroundView?.frame = CGRect(x: 0, y: frame.size.height-15-2*recordButtonBackgroundViewRadius, width: 2*recordButtonBackgroundViewRadius, height: 2*recordButtonBackgroundViewRadius)
        recordButtonBackgroundView?.center = CGPointMake(center.x, recordButtonBackgroundView!.center.y)
        
        recordButton?.frame = CGRect(x: 0, y: 0, width: 2*recordButtonRadius, height: 2*recordButtonRadius)
        recordButton?.center = recordButtonBackgroundView!.center
    }
    
}

extension UIImage {
    class func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextFillRect(context, rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
}
