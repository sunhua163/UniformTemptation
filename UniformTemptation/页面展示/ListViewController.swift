//
//  ListViewController.swift
//  UniformTemptation
//
//  Created by Even on 16/10/29.
//  Copyright © 2016年 sunhua. All rights reserved.

import UIKit
import RxSwift
import RxDataSources
import Alamofire

class ListViewController: BaseViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    let viewModel = ListViewModel()
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.rx.setDelegate(self).addDisposableTo(bag)
        
        // 把datasource设置到啦ListViewModel那里，需要在那里实现
        //        collectionView.rx.setDataSource(viewModel.rx_dataSource).addDisposableTo(bag)
        
        bindViewModel()
    }
    
    func bindViewModel(){
        
        viewModel.rx_dataSource.configureCell = { dataSource, collectionView, indexPath, girl in
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! GirlCollectionViewCell
            cell.girl = girl
            return cell
        }
        // 将数据绑定到collectionview上
        viewModel
            .rx_girls
            .asObservable()
            .map { girls in
                [SectionModel(model:"",items:girls)]
            }.bindTo(collectionView.rx.items(dataSource: viewModel.rx_dataSource))
            .addDisposableTo(bag)
        
    }
    
}
extension ListViewController: UICollectionViewDelegateFlowLayout {
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
