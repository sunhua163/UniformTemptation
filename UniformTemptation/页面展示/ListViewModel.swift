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
    
    func request_girls()
    {
        Girl
            .requestForArray(router: Router.GirlList)?
            .retry(3)
            .subscribe(onNext: {[weak self] (arr,response) in
                if let SELF = self , let itemsArr = arr{
                    SELF.rx_girls.value = itemsArr
//                    SELF.haveLoadData.onNext(true)
                }
            }).addDisposableTo(bag)
        
    }
}
