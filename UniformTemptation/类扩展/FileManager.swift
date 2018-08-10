//
//  FileManager.swift
//  UniformTemptation
//
//  Created by Even on 2016/12/4.
//  Copyright © 2016年 sunhua. All rights reserved.
//

import Foundation

extension FileManager{
    
    // document path
    class func documentPathForFileName(name: String)->String{
        var path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last! as String
        path += "/\(name).data"
        print("current path is -- \(path)")
        return path
    }
    
    // save arr data
    class func saveArrayDataForFileName(data: NSArray, name: String){
        data.write(toFile: documentPathForFileName(name: name), atomically: true)
    }
    
    // del data
    class func delDataForFileName(name: String)
    {
        do{
            try FileManager.default.removeItem(atPath: documentPathForFileName(name: name))
        }catch{}
    }
    
    // get arr data
    class func dataArrayForFileName(name: String)->[Any]?
    {
        let arr = NSArray(contentsOfFile: documentPathForFileName(name: name)) as! [Any]?
        print("获取到了数据 -- \(arr)")
        return arr
    }
}
