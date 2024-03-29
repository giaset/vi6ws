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
    
    let hamburgerButton = UIButton()
    let flashButton = UIButton()
    let flipButton = UIButton()
    let importButton = UIButton()
    
    let statusBarHeight: CGFloat = 44
    let recordButtonRadius: CGFloat = 36
    let recordButtonBorderWidth: CGFloat = 8
    let padding: CGFloat = 15
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
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
        recordButton?.setBackgroundImage(UIImage.imageWithColor(UIColor.whiteColor()), forState: .Highlighted)
        recordButton?.layer.cornerRadius = recordButtonRadius
        recordButton?.clipsToBounds = true
        addSubview(recordButton!)
        
        let hamburgerImage = UIImage(named: "hamburger")?.imageWithRenderingMode(.AlwaysTemplate)
        hamburgerButton.setBackgroundImage(hamburgerImage, forState: .Normal)
        hamburgerButton.tintColor = UIColor.blackColor()
        hamburgerButton.showsTouchWhenHighlighted = true
        addSubview(hamburgerButton)
        
        flashButton.setBackgroundImage(UIImage(named: "flash"), forState: .Normal)
        flashButton.setBackgroundImage(UIImage(named: "flash-selected"), forState: .Selected)
        addSubview(flashButton)
        
        flipButton.setBackgroundImage(UIImage(named: "flip"), forState: .Normal)
        addSubview(flipButton)
        
        importButton.setBackgroundImage(UIImage(named: "import"), forState: .Normal)
        importButton.showsTouchWhenHighlighted = true
        addSubview(importButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundView?.frame = frame
        
        let recordButtonBackgroundViewRadius = recordButtonRadius+recordButtonBorderWidth
        recordButtonBackgroundView?.frame = CGRect(x: 0, y: frame.size.height-15-2*recordButtonBackgroundViewRadius, width: 2*recordButtonBackgroundViewRadius, height: 2*recordButtonBackgroundViewRadius)
        recordButtonBackgroundView?.center = CGPoint(x: center.x, y: recordButtonBackgroundView!.center.y)
        
        recordButton?.frame = CGRect(x: 0, y: 0, width: 2*recordButtonRadius, height: 2*recordButtonRadius)
        recordButton?.center = recordButtonBackgroundView!.center
        
        let hamburgerButtonSize = CGSize(width: 35, height: 27)
        hamburgerButton.frame = CGRect(x: 22, y: frame.size.height-28-hamburgerButtonSize.height, width: hamburgerButtonSize.width, height: hamburgerButtonSize.height)
        
        let flashButtonSize = CGSize(width: 17, height: 25)
        flashButton.frame = CGRect(x: 22, y: 0, width: flashButtonSize.width, height: flashButtonSize.height)
        flashButton.center = CGPoint(x: flashButton.center.x, y: statusBarHeight/2)
        
        let flipButtonSize = CGSize(width: 24, height: 27)
        flipButton.frame = CGRect(x: frame.size.width-22-flipButtonSize.width, y: 0, width: flipButtonSize.width, height: flipButtonSize.height)
        flipButton.center = CGPoint(x: flipButton.center.x, y: statusBarHeight/2)
        
        let importButtonSize = CGSize(width: 29, height: 23)
        importButton.frame = CGRect(x: frame.size.width-importButtonSize.width-22, y: 0, width: importButtonSize.width, height: importButtonSize.height)
        importButton.center = CGPoint(x: importButton.center.x, y: hamburgerButton.center.y)
    }
    
}
