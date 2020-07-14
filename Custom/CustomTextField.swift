//
//  customTextField.swift
//  GrubityIntern
//
//  Created by DUY on 8/26/19.
//  Copyright © 2019 DUY. All rights reserved.
//

import UIKit

class customTextField: UITextField, UITextFieldDelegate {
    let bottomLine = CALayer()
    func underlineTextField() {
        let lineWidth = CGFloat(1)
        bottomLine.borderColor = UIColor.lightGray.cgColor
        bottomLine.frame = CGRect(x: 0.0, y: self.frame.size.height - lineWidth, width: self.frame.size.width, height: self.frame.size.height)
        bottomLine.borderWidth = lineWidth
        self.layer.addSublayer(bottomLine)
        self.layer.masksToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        delegate = self
        underlineTextField()
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        delegate = self
        underlineTextField()
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        bottomLine.borderColor = UIColor.red.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        bottomLine.borderColor = UIColor.lightGray.cgColor
    }
}


