//
//  WatermarkPickerView.swift
//  vi6ws
//
//  Created by Gianni Settino on 2014-12-31.
//  Copyright (c) 2014 Milton and Parc. All rights reserved.
//

import UIKit

class WatermarkPickerView: UIView {
    
    var buttons = [UIButton]()
    var images = [[String: UIImage]]()
    
    let separator = UIView()
    
    var pickedImageClosure: ((image: UIImage) -> Void)?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        images.append(["white": UIImage(named: "6GOD-white")!, "black": UIImage(named: "6GOD-black")!])
        images.append(["white": UIImage(named: "6-white")!, "black": UIImage(named: "6-black")!])
        images.append(["white": UIImage(named: "owl-white")!, "black": UIImage(named: "owl-black")!])
        images.append(["white": UIImage(named: "new-partynextdoor-white")!, "black": UIImage(named: "new-partynextdoor-black")!])
        images.append(["white": UIImage(named: "topszn-white")!, "black": UIImage(named: "topszn-black")!])
        images.append(["white": UIImage(named: "bills-white")!, "black": UIImage(named: "bills-black")!])
        images.append(["white": UIImage(named: "ovosound-white")!, "black": UIImage(named: "ovosound-black")!])
        images.append(["white": UIImage(named: "majidjordan-white")!, "black": UIImage(named: "majidjordan-black")!])
        
        for image in images {
            let button = UIButton()
            button.imageView?.contentMode = .ScaleAspectFit
            button.setImage(image["black"], forState: .Normal)
            button.setImage(image["white"], forState: .Highlighted)
            button.addTarget(self, action: #selector(buttonPressed(_:)), forControlEvents: .TouchUpInside)
            addSubview(button)
            buttons.append(button)
        }
        
        separator.backgroundColor = UIColor(red: 0.698, green: 0.698, blue: 0.694, alpha: 1)
        addSubview(separator)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let buttonWidth = frame.size.width/2
        let buttonHeight = frame.size.height/4
        
        for i in 0...7 {
            if i < 4 {
                buttons[i].frame = CGRect(x: 0, y: CGFloat(i)*buttonHeight, width: buttonWidth, height: buttonHeight)
            } else {
                buttons[i].frame = CGRect(x: buttonWidth, y: CGFloat(i-4)*buttonHeight, width: buttonWidth, height: buttonHeight)
            }
            buttons[i].imageEdgeInsets = UIEdgeInsets(top: 10, left: 50, bottom: 10, right: 50)
        }
        
        separator.frame = CGRect(x: 0, y: 0, width: 2, height: frame.height)
        separator.center = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
    }
    
    func buttonPressed(button: UIButton) {
        for otherButton in buttons {
            if otherButton != button {
                otherButton.selected = false
            }
        }
        
        button.selected = !button.selected
        
        if button.selected {
            pickedImageClosure?(image: button.imageForState(.Normal)!)
        } else {
            pickedImageClosure?(image: button.imageForState(.Highlighted)!)
        }
    }
    
}
