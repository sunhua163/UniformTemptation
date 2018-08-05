//
//  PureController.swift
//  UniformTemptation
//
//  Created by Even on 2018/8/5.
//  Copyright © 2018年 sunhua. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources
import Alamofire

class PureController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    fileprivate let pureViewModel = PureViewModel()
    fileprivate let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.rx.setDelegate(self).addDisposableTo(bag)
        
        bindViewModel()
    }
    
    func bindViewModel(){
        
        pureViewModel.rxDataSource.configureCell = {(dataSource, collectionView, indexPath, girl) in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! GirlCollectionViewCell
            cell.fillData(girl: girl)
            return cell
        }
        
        pureViewModel
            .rxList
            .asObservable()
            .map { girls in
                [SectionModel(model: "", items: girls)]
            }.bindTo(collectionView.rx.items(dataSource: pureViewModel.rxDataSource))
            .addDisposableTo(bag)
    }
}
extension PureController: UICollectionViewDelegateFlowLayout {
    // item size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ScreenWidth/2-1, height: (3*ScreenWidth)/4 + 45)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 1, bottom: 8, right: 1)
    }
    
}
