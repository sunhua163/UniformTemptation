//
//  BaseViewController.swift
//  UniformTemptation
//
//  Created by Even on 16/10/29.
//  Copyright © 2016年 sunhua. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var hidesBottomBarWhenPushed: Bool {
        set{
            super.hidesBottomBarWhenPushed = newValue
        }
        get{
            return navigationController?.viewControllers.first != self
        }
    }
}
