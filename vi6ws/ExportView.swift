//
//  ExportView.swift
//  VI6WS
//
//  Created by Gianni Settino on 2015-01-11.
//  Copyright (c) 2015 Milton and Parc. All rights reserved.
//

import UIKit

class ExportView: UIView {
    
    let backgroundView = UIImageView()
    
    let closeButton = UIButton()
    let closeButtonDimView = UIView()
    
    let cameraRollButton = UIButton()
    let instagramButton = UIButton()
    let facebookButton = UIButton()
    let twitterButton = UIButton()
    
    let separator1 = UIView()
    let separator2 = UIView()
    let separator3 = UIView()
    
    let separatorHeight: CGFloat = 2
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        clipsToBounds = true
        
        backgroundView.image = UIImage(named: "marble")
        backgroundView.contentMode = .ScaleAspectFill
        addSubview(backgroundView)
        
        closeButtonDimView.backgroundColor = UIColor(red: 0.055, green: 0.063, blue: 0.067, alpha: 1) /*#0e1011*/
        closeButtonDimView.alpha = 0.3
        addSubview(closeButtonDimView)
        
        closeButton.setImage(UIImage(named: "close"), forState: .Normal)
        addSubview(closeButton)
        
        let textColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1) /*#333333*/
        let transparentBlack = UIColor(red: 0.055, green: 0.063, blue: 0.067, alpha: 0.3)
        
        cameraRollButton.setImage(UIImage(named: "camera_roll"), forState: .Normal)
        cameraRollButton.setTitle("SAVE TO CAMERA ROLL", forState: .Normal)
        cameraRollButton.setTitleColor(textColor, forState: .Normal)
        cameraRollButton.setTitleColor(UIColor.blackColor(), forState: .Highlighted)
        cameraRollButton.titleLabel!.font = UIFont(name: "FuturaBT-Heavy", size: 16)
        cameraRollButton.setBackgroundImage(UIImage.imageWithColor(transparentBlack), forState: .Highlighted)
        cameraRollButton.contentHorizontalAlignment = .Left
        cameraRollButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 21, bottom: 0, right: 0)
        cameraRollButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 0)
        addSubview(cameraRollButton)
        
        instagramButton.setImage(UIImage(named: "instagram"), forState: .Normal)
        instagramButton.setTitle("OPEN IN INSTAGRAM", forState: .Normal)
        instagramButton.setTitleColor(textColor, forState: .Normal)
        instagramButton.setTitleColor(UIColor.blackColor(), forState: .Highlighted)
        instagramButton.titleLabel!.font = UIFont(name: "FuturaBT-Heavy", size: 16)
        instagramButton.setBackgroundImage(UIImage.imageWithColor(transparentBlack), forState: .Highlighted)
        instagramButton.contentHorizontalAlignment = .Left
        instagramButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 21, bottom: 0, right: 0)
        instagramButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 0)
        addSubview(instagramButton)
        
        facebookButton.setImage(UIImage(named: "facebook"), forState: .Normal)
        facebookButton.setTitle("OPEN IN FACEBOOK", forState: .Normal)
        facebookButton.setTitleColor(textColor, forState: .Normal)
        facebookButton.setTitleColor(UIColor.blackColor(), forState: .Highlighted)
        facebookButton.titleLabel!.font = UIFont(name: "FuturaBT-Heavy", size: 16)
        facebookButton.setBackgroundImage(UIImage.imageWithColor(transparentBlack), forState: .Highlighted)
        facebookButton.contentHorizontalAlignment = .Left
        facebookButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 21, bottom: 0, right: 0)
        facebookButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 0)
        addSubview(facebookButton)
        
        twitterButton.setImage(UIImage(named: "twitter"), forState: .Normal)
        twitterButton.setTitle("OPEN IN TWITTER", forState: .Normal)
        twitterButton.setTitleColor(textColor, forState: .Normal)
        twitterButton.setTitleColor(UIColor.blackColor(), forState: .Highlighted)
        twitterButton.titleLabel!.font = UIFont(name: "FuturaBT-Heavy", size: 16)
        twitterButton.setBackgroundImage(UIImage.imageWithColor(transparentBlack), forState: .Highlighted)
        twitterButton.contentHorizontalAlignment = .Left
        twitterButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 21, bottom: 0, right: 0)
        twitterButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 0)
        addSubview(twitterButton)
        
        let separatorColor = UIColor(red: 0.129, green: 0.154, blue: 0.169, alpha: 1) /*#21272b*/
        
        separator1.backgroundColor = separatorColor
        addSubview(separator1)
        
        separator2.backgroundColor = separatorColor
        addSubview(separator2)
        
        separator3.backgroundColor = separatorColor
        addSubview(separator3)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundView.frame = bounds
        
        let buttonHeight = (frame.height - (3*separatorHeight))/5
        
        closeButtonDimView.frame = CGRect(x: 0, y: 0, width: frame.width, height: buttonHeight)
        
        closeButton.frame = CGRect(x: 0, y: 0, width: buttonHeight, height: buttonHeight)
        
        cameraRollButton.frame = CGRect(x: 0, y: buttonHeight, width: frame.width, height: buttonHeight)
        separator1.frame = CGRect(x: 0, y: 2*buttonHeight, width: frame.width, height: separatorHeight)
        
        instagramButton.frame = CGRect(x: 0, y: 2*buttonHeight+separatorHeight, width: frame.width, height: buttonHeight)
        separator2.frame = CGRect(x: 0, y: 3*buttonHeight+separatorHeight, width: frame.width, height: separatorHeight)
        
        facebookButton.frame = CGRect(x: 0, y: 3*buttonHeight+2*separatorHeight, width: frame.width, height: buttonHeight)
        separator3.frame = CGRect(x: 0, y: 4*buttonHeight+(2*separatorHeight), width: frame.width, height: separatorHeight)
        
        twitterButton.frame = CGRect(x: 0, y: 4*buttonHeight+3*separatorHeight, width: frame.width, height: buttonHeight)
    }
    
}
