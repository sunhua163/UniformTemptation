//
//  ListViewModel.swift
//  UniformTemptation
//
//  Created by Even on 16/10/29.
//  Copyright © 2016年 sunhua. All rights reserved.
//

import Foundation
import RxSwift
import RxDataSources
import ObjectMapper
class ListViewModel{
    
//    let rx_girls = Variable<[SectionModel<String, Girl>]>([])
//    var haveLoadData = PublishSubject<Bool>()
    
    
    let rx_girls = Variable<[Girl]>([])
    private let bag = DisposeBag()
    
    
    let rx_dataSource = RxCollectionViewSectionedReloadDataSource<SectionModel<String, Girl>>()
    
    init() {
        request_girls()
    }
    
    // 查看内存有没有，没有看本地有没有
    // 思路1：请求数据库，数据库中有，则返回数据，没有，则请求网络，之后的操作都是对于数据库操作
    // 思路2：请求本地缓存，本地有则加载本地，当APP退出时存本地，APP启动时候把本地存入内存，思路2更简单方便
    
    func request_girls()
    { 
        if let girlArr = DataBase.shareDataBase.girlList {
            self.rx_girls.value = girlArr
        }else{
            Girl
                .requestForArray(router: Router.GirlList)?
                .retry(3)
                .subscribe(onNext: {[weak self] (arr,response) in
                    if let SELF = self , let itemsArr = arr{
                        SELF.rx_girls.value = itemsArr
                        DataBase.shareDataBase.girlList = itemsArr
    //                    SELF.haveLoadData.onNext(true)
                    }
                }).addDisposableTo(bag)
        }
    }
}
