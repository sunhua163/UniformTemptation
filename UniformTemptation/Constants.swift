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
 http://www.tngou.net/tnfs/api/list?page=1&rows=50
 http://www.tngou.net/tnfs/api/list?page=1&rows=30
 
 // 备用
 https://raw.githubusercontent.com/facebook/react-native/0.51-stable/docs/MoviesExample.json
 
 http://image.baidu.com/channel/listjson?pn=0&rn=30&tag1=美女&tag2=全部&ie=utf8
 
 
 
http://image.baidu.com/channel/listjson?pn=0&rn=30&tag1=明星&tag2=全部&ftags=女明星##内地&ie=utf8
 */

let ScreenWidth = UIScreen.main.bounds.width
let ScreenHeight = UIScreen.main.bounds.height
let ScreenScale = UIScreen.main.scale

enum Router:String{
    case girlList = "http://image.baidu.com/channel/listjson?pn=0&rn=30&tag1=美女&tag2=全部&ftags=小清新&ie=utf8"
}


