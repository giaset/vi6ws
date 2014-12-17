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
    var captureButton: UIButton?
    
    let statusBarHeight = 44
    
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
        
        /*
        
        var bottomBlurView = UIVisualEffectView(effect: blurEffect)
        bottomBlurView.frame = CGRect(x: 0, y: view.bounds.size.height-topAndBottomViewHeight, width: previewSquareSize, height: topAndBottomViewHeight)
        view.addSubview(bottomBlurView)
        
        var recordButtonRadius: CGFloat = 45
        var recordButtonBorderOffset: CGFloat = 10
        
        var recordButtonBorder = UIView(frame: CGRectMake(0, 0, 2*(recordButtonRadius+recordButtonBorderOffset), 2*(recordButtonRadius+recordButtonBorderOffset)))
        recordButtonBorder.backgroundColor = UIColor.clearColor()
        recordButtonBorder.layer.borderColor = UIColor.whiteColor().CGColor
        recordButtonBorder.layer.borderWidth = recordButtonBorderOffset/2
        recordButtonBorder.layer.masksToBounds = true
        recordButtonBorder.layer.cornerRadius = recordButtonRadius+recordButtonBorderOffset
        recordButtonBorder.center = CGPoint(x: view.center.x, y: bottomBlurView.center.y)
        view.addSubview(recordButtonBorder)
        
        var recordButton = UIButton(frame: CGRectMake(0, 0, 2*recordButtonRadius, 2*recordButtonRadius))
        recordButton.layer.masksToBounds = true
        recordButton.layer.cornerRadius = recordButtonRadius
        recordButton.backgroundColor = UIColor.whiteColor()
        recordButton.center = CGPoint(x: view.center.x, y: bottomBlurView.center.y)
        view.addSubview(recordButton)*/
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundView?.frame = frame
    }
    
}
