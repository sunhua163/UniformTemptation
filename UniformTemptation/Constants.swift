//
//  Constants.swift
//  UniformTemptation
//
//  Created by Even on 16/10/29.
//  Copyright © 2016年 sunhua. All rights reserved.
//

import Foundation
import UIKit
// 我在http://www.tngou.net/doc/gallery找的 free api
// 大体上我想展示的是 swift 以及函数响应式编程
/*
 http://tnfs.tngou.net/image/ext/150714/e76407c9a23da57a0f30690aa7917f3e.jpg_180x120
 
 http://www.tngou.net/tnfs/api/list?page=1&rows=30
 */

let ScreenWidth = UIScreen.main.bounds.width
let ScreenHeight = UIScreen.main.bounds.height
let ScreenScale = UIScreen.main.scale

enum Router:String{
    case GirlList = "http://www.tngou.net/tnfs/api/list?page=1&rows=50"
}


