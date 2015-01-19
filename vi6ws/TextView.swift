//
//  TextView.swift
//  VI6WS
//
//  Created by Gianni Settino on 2015-01-18.
//  Copyright (c) 2015 Milton and Parc. All rights reserved.
//

import UIKit

class TextView: UIView {
    
    let backgroundView = UIImageView()
    let scrollView = UIScrollView()
    let textView = UITextView()
    let backButton = UIButton()
    
    let statusBarHeight: CGFloat = 44
    let padding: CGFloat = 15
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundView = UIImageView(image: UIImage(named: "marble"))
        addSubview(backgroundView)
        
        backButton.setTitle("BACK", forState: .Normal)
        backButton.titleLabel!.font = UIFont(name: "FuturaBT-Heavy", size: 16)
        backButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        backButton.setTitleColor(UIColor.whiteColor(), forState: .Highlighted)
        addSubview(backButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundView.frame = frame
        
        backButton.sizeToFit()
        backButton.frame = CGRect(x: padding, y: 0, width: backButton.frame.size.width, height: backButton.frame.size.height)
        backButton.center = CGPointMake(backButton.center.x, statusBarHeight/2)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setText(text: String) {
        textView.text = text
    }
    
}
