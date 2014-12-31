//
//  WatermarkPickerView.swift
//  vi6ws
//
//  Created by Gianni Settino on 2014-12-31.
//  Copyright (c) 2014 Milton and Parc. All rights reserved.
//

import UIKit

class WatermarkPickerView: UIView {
    
    let buttons = [UIButton]()
    let images = [[String: UIImage]]()
    
    var pickedImageClosure: (image: UIImage) -> ()
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        pickedImageClosure = { image in }
        
        super.init(frame: frame)
        
        images.append(["white": UIImage(named: "6GOD-white")!, "black": UIImage(named: "6GOD-black")!])
        images.append(["white": UIImage(named: "6-white")!, "black": UIImage(named: "6-black")!])
        images.append(["white": UIImage(named: "owl-white")!, "black": UIImage(named: "owl-black")!])
        images.append(["white": UIImage(named: "416-filled-white-small")!, "black": UIImage(named: "416-filled-black-small")!])
        images.append(["white": UIImage(named: "topszn-white")!, "black": UIImage(named: "topszn-black")!])
        images.append(["black": UIImage(named: "partynextdoor")!])
        images.append(["white": UIImage(named: "ovosound-white")!, "black": UIImage(named: "ovosound-black")!])
        images.append(["white": UIImage(named: "majidjordan-white")!, "black": UIImage(named: "majidjordan-black")!])
        
        for image in images {
            var button = UIButton()
            button.imageView!.contentMode = .ScaleAspectFit
            button.setImage(image["black"], forState: .Normal)
            button.setImage(image["white"], forState: .Highlighted)
            button.addTarget(self, action: "buttonPressed:", forControlEvents: .TouchUpInside)
            addSubview(button)
            buttons.append(button)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var buttonWidth = frame.size.width/2
        var buttonHeight = frame.size.height/4
        
        for i in 0...7 {
            if (i < 4) {
                buttons[i].frame = CGRectMake(0, CGFloat(i)*buttonHeight, buttonWidth, buttonHeight)
            } else {
                buttons[i].frame = CGRectMake(buttonWidth, CGFloat(i-4)*buttonHeight, buttonWidth, buttonHeight)
            }
        }
    }
    
    func buttonPressed(button: UIButton) {
        for otherButton in buttons {
            if (otherButton != button) {
                otherButton.selected = false
            }
        }
        
        button.selected = !button.selected
        
        if (button.selected) {
            pickedImageClosure(image: button.imageForState(.Normal)!)
        } else {
            pickedImageClosure(image: button.imageForState(.Highlighted)!)
        }
    }
    
}
