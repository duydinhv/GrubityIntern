//
//  CustomPageViewController.swift
//  GrubityIntern
//
//  Created by DUY on 8/20/19.
//  Copyright © 2019 DUY. All rights reserved.
//

import UIKit

@IBDesignable class CustomPageControl: UIPageControl {
    private var numberOfDots = [UIView]() {
        didSet {
            if numberOfDots.count == numberOfPages {
                setupViews()
            }
        }
    }
    
    @IBInspectable var NumberOfPages: Int = 0 {
        didSet {
            for tag in 0 ..< NumberOfPages {
                
            }
        }
    }
}
