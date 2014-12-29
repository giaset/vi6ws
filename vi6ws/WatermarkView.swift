//
//  WatermarkView.swift
//  vi6ws
//
//  Created by Gianni Settino on 2014-12-29.
//  Copyright (c) 2014 Milton and Parc. All rights reserved.
//

import UIKit

class WatermarkView: UIView {
    
    let backgroundView = UIImageView()
    let imageView = UIImageView()
    let backButton = UIButton()
    let exportButton = UIButton()
    
    let statusBarHeight: CGFloat = 44
    let padding: CGFloat = 15
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundView = UIImageView(image: UIImage(named: "marble"))
        addSubview(backgroundView)
        
        addSubview(imageView)
        
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
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundView.frame = frame
        
        imageView.frame = CGRect(x: 0, y: statusBarHeight, width: frame.size.width, height: frame.size.width)
        
        backButton.sizeToFit()
        backButton.frame = CGRect(x: padding, y: 0, width: backButton.frame.size.width, height: backButton.frame.size.height)
        backButton.center = CGPointMake(backButton.center.x, statusBarHeight/2)
        
        exportButton.sizeToFit()
        exportButton.frame = CGRect(x: frame.size.width-padding-exportButton.frame.size.width, y: 0, width: exportButton.frame.size.width, height: exportButton.frame.size.height)
        exportButton.center = CGPointMake(exportButton.center.x, statusBarHeight/2)
    }
    
}
