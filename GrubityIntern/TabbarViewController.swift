//
//  TabbarViewController.swift
//  GrubityIntern
//
//  Created by DUY on 7/16/20.
//  Copyright © 2020 DUY. All rights reserved.
//

import UIKit
import Firebase

class TabbarViewController: UITabBarController {

    var searchBarButtonItem: UIBarButtonItem!
    var user: User!
    let UserRef = Database.database().reference(withPath: "online")
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem?.tintColor = .red
        
        Auth.auth().addStateDidChangeListener { auth, user in
            guard let user = user else { return }
            self.user = User(authData: user)
            
            let currentUser = self.UserRef.child(self.user.uid)
            currentUser.setValue(self.user.email)
            currentUser.onDisconnectRemoveValue()
        }
    }
}
