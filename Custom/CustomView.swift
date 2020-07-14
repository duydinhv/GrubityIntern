//
//  CustomViewController.swift
//  GrubityIntern
//
//  Created by DUY on 8/19/19.
//  Copyright © 2019 DUY. All rights reserved.
//

import UIKit

@IBDesignable class CustomView: UIView {
    @IBInspectable var ViewBackgroundColor: UIColor? {
        get {
            return UIColor(cgColor: self.ViewBackgroundColor as! CGColor)
        }
        set {
            self.backgroundColor = newValue
        }
    }
    
    @IBInspectable var viewCornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}

