//
//  TextView.swift
//  VI6WS
//
//  Created by Gianni Settino on 2015-01-18.
//  Copyright (c) 2015 Milton and Parc. All rights reserved.
//

import UIKit

class TextView: UIView {
    
    var backgroundView = UIImageView()
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
        
        textView.font = UIFont(name: "FuturaBT-Heavy", size: 16)
        textView.backgroundColor = UIColor.clearColor()
        textView.textContainer.lineFragmentPadding = 0
        textView.textContainerInset = UIEdgeInsetsZero
        textView.editable = false
        addSubview(textView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundView.frame = frame
        
        backButton.sizeToFit()
        backButton.frame = CGRect(x: padding, y: 0, width: backButton.frame.size.width, height: backButton.frame.size.height)
        backButton.center.y = statusBarHeight*0.5
        
        textView.frame = CGRect(x: padding, y: statusBarHeight, width: frame.width-2*padding, height: frame.height-statusBarHeight)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setText(text: String) {
        textView.text = text.uppercaseString
    }
    
}
