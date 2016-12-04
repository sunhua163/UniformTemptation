//
//  User.swift
//  UniformTemptation
//
//  Created by jiaozhen guo on 2016/11/20.
//  Copyright © 2016年 sunhua. All rights reserved.
//

import Foundation
import ObjectMapper
class User{
    static let shareUser = User()
    private init() {}
    
    var favorite = [Girl]()
    
}

class DataBase{
    
    static let shareDataBase = DataBase()
    private init(){}
    
    static let fileName = "gileList"
    
    // resource
    var girlList: [Girl]? = {
        
        let arr = FileManager.dataArrayForFileName(name: fileName)
        
        let girls = Mapper<Girl>().mapArray(JSONArray: arr as! [[String : Any]])
        
        return girls
    }()
    
    // save list
    func saveGirlList()
    {
        if let list = DataBase.shareDataBase.girlList{
            let arr = list.toJSON() as NSArray
            print("当前存储了数据\(arr)")
            FileManager.saveArrayDataForFileName(data: arr, name: DataBase.fileName)
        }
    }
    
    // update one girl model state
    func updateGirlState(model: Girl)
    {
        
    }
}
