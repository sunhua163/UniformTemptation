//
//  PureListViewModel.swift
//  UniformTemptation
//
//  Created by Even on 2018/8/5.
//  Copyright © 2018年 sunhua. All rights reserved.
//

import Foundation
import RxSwift
import RxDataSources
import ObjectMapper

class PureViewModel {
    
    let rxList = Variable<[Girl]>([])
    let rxDataSource = RxCollectionViewSectionedReloadDataSource<SectionModel<String, Girl>>()
    private let bag = DisposeBag()
    
    init() {
        requestList()
    }
    
    func requestList() {
        Girl
            .requestForArray(router: .pureGirlList)?
            .retry(3)
            .subscribe(onNext: {[weak self] (list, respponse) in

                guard let strongSelf = self, let list = list else { return }
                strongSelf.rxList.value = list
                
            }).addDisposableTo(bag)
    }
}
