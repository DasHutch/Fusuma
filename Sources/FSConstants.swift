//
//  FSConstants.swift
//  Fusuma
//
//  Created by Yuta Akizuki on 2015/08/31.
//  Copyright © 2015年 ytakzk. All rights reserved.
//

import UIKit

// Extension
internal extension UIColor {
    
    class func hex (hexStr : NSString, alpha : CGFloat) -> UIColor {
        
        let realHexStr = hexStr.stringByReplacingOccurrencesOfString("#", withString: "")
        let scanner = NSScanner(string: realHexStr as String)
        var color: UInt32 = 0
        if scanner.scanHexInt(&color) {
            let r = CGFloat((color & 0xFF0000) >> 16) / 255.0
            let g = CGFloat((color & 0x00FF00) >> 8) / 255.0
            let b = CGFloat(color & 0x0000FF) / 255.0
            return UIColor(red:r,green:g,blue:b,alpha:alpha)
        } else {
            print("invalid hex string", terminator: "")
            return UIColor.whiteColor()
        }
    }
}

extension UIView {
    
    func addBottomBorder(color: UIColor, width: CGFloat) {
        let border = UIView()
        border.backgroundColor = color

        addSubview(border)

        border.backgroundColor = color
        border.translatesAutoresizingMaskIntoConstraints = false
        border.addConstraint(NSLayoutConstraint(item: border,
            attribute: .Height,
            relatedBy: .Equal,
            toItem: nil,
            attribute: .Height,
            multiplier: 1, constant: 3))
        addConstraint(NSLayoutConstraint(item: border,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Bottom,
            multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: border,
            attribute: .Leading,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Leading,
            multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: border,
            attribute: .Trailing,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Trailing,
            multiplier: 1, constant: 0))
    }
}
