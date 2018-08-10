//
//  User.swift
//  UniformTemptation
//
//  Created by Even on 2016/11/20.
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
        
//        let girls = Mapper<Girl>().mapArray(JSONArray: arr as! [[String : Any]])
        
        return arr == nil ? nil : Mapper<Girl>().mapArray(JSONArray: arr as! [[String : Any]])
    }()
    
    // save list
    func saveGirlList()
    {
        if let list = DataBase.shareDataBase.girlList{
            let arr = list.toJSON() as NSArray
            print(" save girl list detail -> \(arr)")
            FileManager.saveArrayDataForFileName(data: arr, name: DataBase.fileName)
        }
    }
    
    // update one girl model state
    func updateGirlState(model: Girl)
    {
        
    }
}
