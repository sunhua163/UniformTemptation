//
//  GirlCollectionViewCell.swift
//  UniformTemptation
//
//  Created by Even on 16/10/29.
//  Copyright © 2016年 sunhua. All rights reserved.
//

import UIKit
import Kingfisher
import RxSwift

class GirlCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var discribe: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    private var bag = DisposeBag()
    
    @IBAction func addToFavorite(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        bag = DisposeBag()
    }
    
    func fillData(girl:Girl)
    {
        
            discribe.text = girl.title
            icon.kf.setImage(with: URL(string: girl.img_url))
            
            // 观察 girl 是否被收藏，决定 favoriteButton 的选择状态
            girl
                .rx_favorite
                .asObservable()
                // MainScheduler.instance 更改UI 在主线程上
                // ConcurrentMainScheduler.instance 默认当前线程
                .observeOn(MainScheduler.instance)
                .bindTo(favoriteButton.rx.isSelected)
                .addDisposableTo(bag)
        
            favoriteButton
                .rx
                .tap
                .subscribe(onNext: {
                    girl.requestFavoriteOrNot()
                }).addDisposableTo(bag)
    }
}
