//
//  TextViewController.swift
//  VI6WS
//
//  Created by Gianni Settino on 2015-01-18.
//  Copyright (c) 2015 Milton and Parc. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {
    
    var textView: TextView?
    
    var text: String?
    
    init(text: String) {
        self.text = text
        super.init(nibName: nil, bundle: nil)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView = TextView(frame: view.frame)
        view.addSubview(textView!)
        
        textView!.setText(self.text!)
        
        textView!.backButton.addTarget(self, action: "backButtonPressed", forControlEvents: .TouchUpInside)
    }
    
    func backButtonPressed() {
        navigationController!.popViewControllerAnimated(false)
    }
    
}
