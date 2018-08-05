//
//  FavoriteViewController.swift
//  UniformTemptation
//
//  Created by jiaozhen guo on 2016/11/20.
//  Copyright © 2016年 sunhua. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources

class FavoriteViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate var favorites : [Girl]{
        return User.shareUser.favorite
    }
    
//    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        collectionView.rx.setDelegate(self).addDisposableTo(bag)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
}

extension FavoriteViewController: UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return favorites.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! GirlCollectionViewCell
        
        cell.fillData(girl: favorites[indexPath.row])
        
        return cell
    }
}

extension FavoriteViewController: UICollectionViewDelegateFlowLayout
{
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
