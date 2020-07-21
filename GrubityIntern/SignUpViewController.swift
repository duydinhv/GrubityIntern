//
//  SignUpViewController.swift
//  GrubityIntern
//
//  Created by DUY on 7/14/20.
//  Copyright © 2020 DUY. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var textFieldSignUpEmail: UITextField!
    @IBOutlet weak var textFieldSignUpPassword: UITextField!
    @IBOutlet weak var textFieldSignUpName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func SignUpDidTouch(_ sender: AnyObject) {
        let emailField = textFieldSignUpEmail.text!
        let passwordField = textFieldSignUpPassword.text!
        
        Auth.auth().createUser(withEmail: emailField, password: passwordField) {
            user, error in
            if error == nil {
                Auth.auth().signIn(withEmail: emailField, password: passwordField)
                self.dismiss(animated: true, completion: nil)
            } else {
                let alert = UIAlertController(title: "Error", message: "Email or Password is failed", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}
