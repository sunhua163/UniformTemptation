//
//  GirlCollectionViewCell.swift
//  UniformTemptation
//
//  Created by Even on 16/10/29.
//  Copyright © 2016年 sunhua. All rights reserved.
//

import UIKit
import Kingfisher

class GirlCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var discribe: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    @IBAction func addToFavorite(_ sender: UIButton) {
        
        
    }
    
    var girl : Girl?{
        didSet{
            if let myGirl = girl{
                discribe.text = myGirl.title
                icon.kf.setImage(with: URL(string: myGirl.img_url))
            }
        }
    }
}
