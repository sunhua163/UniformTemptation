//
//  Girl.swift
//  UniformTemptation
//
//  Created by Even on 16/10/29.
//  Copyright © 2016年 sunhua. All rights reserved.
//

import Foundation
import ObjectMapper
/*
 对付程序员，还非得弄点流鼻血的出来 ^_^
 */
class Girl: Mappable{
    var count        = ""
    var fcount       = ""
    var galleryclass = ""
    var id           = ""
    var img          = ""
    {
        didSet{
            img_url = "http://tnfs.tngou.net/image" + img + "_\((3*ScreenWidth)/2)x\(ScreenWidth)"
        }
    }
    var img_url      = ""
    var rcount       = ""
    var size         = ""
    var time         = ""
    var title        = ""
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        count        <- map["count"]
        fcount       <- map["fcount"]
        galleryclass <- map["galleryclass"]
        id           <- map["id"]
        img          <- map["img"]
        rcount       <- map["rcount"]
        size         <- map["size"]
        time         <- map["time"]
        title        <- map["title"]
    }
}
