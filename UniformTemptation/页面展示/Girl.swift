//
//  Girl.swift
//  UniformTemptation
//
//  Created by Even on 16/10/29.
//  Copyright © 2016年 sunhua. All rights reserved.
//

import Foundation
import ObjectMapper
import RxSwift
/*
 对付程序员，还非得弄点流鼻血的出来 ^_^
 */

class Girl: Mappable{
    
    static let rx_favoriteStatuseChange = PublishSubject<(Girl,Bool)>()
    
    var id                    = ""
    var img_url               = ""
    var desc                  = ""
    var image_width: CGFloat  = 0.0
    var image_height: CGFloat = 0.0
    var date                  = ""
    var photo_id              = ""
    var title                 = ""
    
    var rx_favorite  = Variable(false)
    fileprivate let bag = DisposeBag()
    
    init() {
        subscribFavoriteChange()
    }
    
    required init?(map: Map) {
        subscribFavoriteChange()
    }
    
    func mapping(map: Map) {
        id            <- map["id"]
        img_url       <- map["image_url"]
        desc          <- map["desc"]
        image_width   <- map["image_width"]
        date          <- map["date"]
        photo_id      <- map["photo_id"]
        title         <- map["desc"]
    }
    
    // 订阅收藏状态改变
    private func subscribFavoriteChange() {
        Girl.rx_favoriteStatuseChange
            .subscribe(onNext: { [weak self] (girl, _) in
                if let SELF = self, SELF == girl, SELF !== girl {
                    SELF.rx_favorite.value = girl.rx_favorite.value
                }
            })
            .addDisposableTo(bag)
    }
    
    // 模拟请求加入收藏
    func requestFavoriteOrNot()
    {
        let newState = !rx_favorite.value
        rx_favorite.value = newState
        Girl.rx_favoriteStatuseChange.onNext((self, newState))
        switch rx_favorite.value {
        case true:
            User.shareUser.favorite.append(self)
        case false:
            User.shareUser.favorite = User.shareUser.favorite.filter{$0.id != id}
        }
        print("当前收藏列表 \(User.shareUser.favorite)- 更新美女为 -\(id) 新状态-\(rx_favorite.value)")
    }
}

func ==(lhs: Girl, rhs: Girl)-> Bool {
    return lhs.id == rhs.id
}

//class Girl: Mappable{
//    var count        = ""
//    var fcount       = ""
//    var galleryclass = ""
//    var id           = ""
//    var img          = ""
//    {
//        didSet{
//            img_url = "http://tnfs.tngou.net/image" + img + "_\((3*ScreenWidth)/2)x\(ScreenWidth)"
//        }
//    }
//    var img_url      = ""
//    var rcount       = ""
//    var size         = ""
//    var time         = ""
//    var title        = ""
//
////    var favorite     = false
//
//    var rx_favorite  = Variable(false)
//
//    required init?(map: Map) {
//
//    }
//    func mapping(map: Map) {
//        count        <- map["count"]
//        fcount       <- map["fcount"]
//        galleryclass <- map["galleryclass"]
//        id           <- (map["id"], intToStringTransform)
//        img          <- map["img"]
//        rcount       <- map["rcount"]
//        size         <- map["size"]
//        time         <- map["time"]
//        title        <- map["title"]
//    }
//
//    // 模拟请求加入收藏
//    func requestFavoriteOrNot()
//    {
//        rx_favorite.value = !rx_favorite.value
//        switch rx_favorite.value {
//        case true:
//            User.shareUser.favorite.append(self)
//        case false:
//            User.shareUser.favorite = User.shareUser.favorite.filter{$0.id != id}
//        }
//        print("rx_favorite.value -->id \(id)--\(rx_favorite.value)");
//    }
//}
//
















