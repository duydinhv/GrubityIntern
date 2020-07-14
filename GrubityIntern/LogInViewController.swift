//
//  LogInViewController.swift
//  GrubityIntern
//
//  Created by DUY on 8/18/19.
//  Copyright © 2019 DUY. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        username.layer.borderColor = UIColor.lightGray as! CGColor
        password.layer.borderColor = UIColor.lightGray as! CGColor
        
        username.layer.borderWidth = 1.0
        password.layer.borderWidth = 1.0
    }
}
