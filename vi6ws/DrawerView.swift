//
//  DrawerView.swift
//  vi6ws
//
//  Created by Gianni Settino on 2014-12-23.
//  Copyright (c) 2014 Milton and Parc. All rights reserved.
//

import UIKit

class DrawerView: UIView {
    
    let websiteButton = UIButton()
    let aboutButton = UIButton()
    let helpButton = UIButton()
    
    let separator1 = UIView()
    let separator2 = UIView()
    let separator3 = UIView()
    
    let separatorHeight: CGFloat = 2
    let separatorAlpha: CGFloat = 0.15
    let buttonHeight: CGFloat = 66
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        websiteButton.setTitle("VI6WS WEBSITE", forState: .Normal)
        websiteButton.setBackgroundImage(UIImage.imageWithColor(UIColor.blackColor()), forState: .Normal)
        websiteButton.setBackgroundImage(UIImage.imageWithColor(UIColor.whiteColor()), forState: .Highlighted)
        websiteButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        websiteButton.setTitleColor(UIColor.blackColor(), forState: .Highlighted)
        websiteButton.contentHorizontalAlignment = .Left
        websiteButton.contentEdgeInsets = UIEdgeInsetsMake(0, 25, 0, 0)
        websiteButton.titleLabel?.font = UIFont(name: "FuturaBT-Heavy", size: 16)
        addSubview(websiteButton)
        
        aboutButton.setTitle("ABOUT", forState: .Normal)
        aboutButton.setBackgroundImage(UIImage.imageWithColor(UIColor.blackColor()), forState: .Normal)
        aboutButton.setBackgroundImage(UIImage.imageWithColor(UIColor.whiteColor()), forState: .Highlighted)
        aboutButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        aboutButton.setTitleColor(UIColor.blackColor(), forState: .Highlighted)
        aboutButton.contentHorizontalAlignment = .Left
        aboutButton.contentEdgeInsets = UIEdgeInsetsMake(0, 25, 0, 0)
        aboutButton.titleLabel?.font = UIFont(name: "FuturaBT-Heavy", size: 16)
        addSubview(aboutButton)
        
        helpButton.setTitle("HELP", forState: .Normal)
        helpButton.setBackgroundImage(UIImage.imageWithColor(UIColor.blackColor()), forState: .Normal)
        helpButton.setBackgroundImage(UIImage.imageWithColor(UIColor.whiteColor()), forState: .Highlighted)
        helpButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        helpButton.setTitleColor(UIColor.blackColor(), forState: .Highlighted)
        helpButton.contentHorizontalAlignment = .Left
        helpButton.contentEdgeInsets = UIEdgeInsetsMake(0, 25, 0, 0)
        helpButton.titleLabel?.font = UIFont(name: "FuturaBT-Heavy", size: 16)
        addSubview(helpButton)
        
        separator1.backgroundColor = UIColor.whiteColor()
        separator1.alpha = separatorAlpha
        addSubview(separator1)
        
        separator2.backgroundColor = UIColor.whiteColor()
        separator2.alpha = separatorAlpha
        addSubview(separator2)
        
        separator3.backgroundColor = UIColor.whiteColor()
        separator3.alpha = separatorAlpha
        addSubview(separator3)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let totalHeight = (3*separatorHeight)+(3*buttonHeight)
        var currentHeight = self.frame.size.height-totalHeight
        
        separator1.frame = CGRect(x: 0, y: currentHeight, width: frame.size.width, height: separatorHeight)
        currentHeight += separatorHeight
        
        websiteButton.frame = CGRect(x: 0, y: currentHeight, width: frame.size.width, height: buttonHeight)
        currentHeight += buttonHeight
        
        separator2.frame = CGRect(x: 0, y: currentHeight, width: frame.size.width, height: separatorHeight)
        currentHeight += separatorHeight
        
        aboutButton.frame = CGRect(x: 0, y: currentHeight, width: frame.size.width, height: buttonHeight)
        currentHeight += buttonHeight
        
        separator3.frame = CGRect(x: 0, y: currentHeight, width: frame.size.width, height: separatorHeight)
        currentHeight += separatorHeight
        
        helpButton.frame = CGRect(x: 0, y: currentHeight, width: frame.size.width, height: buttonHeight)
    }
    
}
