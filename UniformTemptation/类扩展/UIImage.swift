//
//  UIImage.swift
//  UniformTemptation
//
//  Created by Even on 2016/11/20.
//  Copyright © 2016年 sunhua. All rights reserved.
//

import UIKit
import Foundation
extension UIImage{
    class func imageWithColor(color: UIColor) -> UIImage {//生成一个纯色图片
        
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor)
        context.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}
