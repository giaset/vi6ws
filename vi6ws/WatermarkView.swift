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
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundView = UIImageView(image: UIImage(named: "marble"))
        addSubview(backgroundView)
        
        addSubview(imageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundView.frame = frame
        
        imageView.frame = CGRect(x: 0, y: statusBarHeight, width: frame.size.width, height: frame.size.width)
    }
    
}
