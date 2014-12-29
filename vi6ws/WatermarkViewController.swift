//
//  WatermarkViewController.swift
//  vi6ws
//
//  Created by Gianni Settino on 2014-12-29.
//  Copyright (c) 2014 Milton and Parc. All rights reserved.
//

import UIKit

class WatermarkViewController: UIViewController {
    
    var watermarkView: WatermarkView?
    
    var image: UIImage
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(image: UIImage) {
        self.image = image
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        watermarkView = WatermarkView(frame: view.frame)
        watermarkView!.imageView.image = image
        view.addSubview(watermarkView!)
        
        watermarkView!.backButton.addTarget(self, action: "backButtonPressed", forControlEvents: .TouchUpInside)
    }
    
    func backButtonPressed() {
        navigationController!.popViewControllerAnimated(true)
    }
    
}
