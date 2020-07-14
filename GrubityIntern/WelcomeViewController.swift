//
//  WelcomeViewController.swift
//  GrubityIntern
//
//  Created by DUY on 8/30/19.
//  Copyright © 2019 DUY. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override open var shouldAutorotate: Bool {
        return false
    }
  

}
