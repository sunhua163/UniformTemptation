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
class ListViewModel {
    
//    let rx_girls = Variable<[SectionModel<String, Girl>]>([])
//    var haveLoadData = PublishSubject<Bool>()
    
    //  Variable 有一个 value 属性，我们改变这个 value 属性的值就相当于调用一般 Subjects 的 onNext() 方法，而这个最新的 onNext() 的值就被保存在 value 属性里了，直到我们再次修改它
    let rx_girls = Variable<[Girl]>([])
    private let bag = DisposeBag()
    
    // 创建数据源
    // SectionModel带有一个String作为section的名字，Girl类作为item的类型
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
                .requestForArray(router: .girlList)?
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
