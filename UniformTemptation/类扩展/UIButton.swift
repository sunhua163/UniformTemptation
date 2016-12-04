//
//  UIButton.swift
//  UniformTemptation
//
//  Created by jiaozhen guo on 2016/11/20.
//  Copyright © 2016年 sunhua. All rights reserved.
//

import UIKit

extension UIButton
{
    @IBInspectable var normalBGImage: UIColor{
        set{
            setBackgroundImage(UIImage.imageWithColor(color: newValue), for: .normal)
        }
        get{
            return UIColor()
        }
    }
    
    @IBInspectable var selectBGImage: UIColor{
        set{
            setBackgroundImage(UIImage.imageWithColor(color: newValue), for: .selected)
        }
        get{
            return UIColor()
        }
    }
}
