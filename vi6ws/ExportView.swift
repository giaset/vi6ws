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
        
        let separatorColor = UIColor(red: 0.129, green: 0.154, blue: 0.169, alpha: 1) /*#21272b*/
        
        separator1.backgroundColor = separatorColor
        addSubview(separator1)
        
        separator2.backgroundColor = separatorColor
        addSubview(separator2)
        
        separator3.backgroundColor = separatorColor
        addSubview(separator3)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundView.frame = bounds
        
        let buttonHeight = (frame.height - (3*separatorHeight))/5
        
        closeButtonDimView.frame = CGRect(x: 0, y: 0, width: frame.width, height: buttonHeight)
        
        closeButton.frame = CGRect(x: 0, y: 0, width: buttonHeight, height: buttonHeight)
        
        separator1.frame = CGRect(x: 0, y: 2*buttonHeight, width: frame.width, height: separatorHeight)
        separator2.frame = CGRect(x: 0, y: 3*buttonHeight+separatorHeight, width: frame.width, height: separatorHeight)
        separator3.frame = CGRect(x: 0, y: 4*buttonHeight+(2*separatorHeight), width: frame.width, height: separatorHeight)
    }
    
}
