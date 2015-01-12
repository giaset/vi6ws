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
    let buttonHeight: CGFloat = 50
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
}
