//
//  GlobalMethods.swift
//  UniformTemptation
//
//  Created by Even on 16/10/29.
//  Copyright © 2016年 sunhua. All rights reserved.
//

import Foundation
import AlamofireObjectMapper
import ObjectMapper
import RxSwift
import Alamofire

extension Mappable{
    static func requestForArray(router: Router)-> Observable<([Self]?, HTTPURLResponse?)>? {
        
        do{
            let url = try router.rawValue.asURL()
            let request = URLRequest(url: url)
            return rx_request(router: request)
        }catch{}
        
        return nil
    }
}

func rx_request<T:Mappable>(router: URLRequestConvertible)-> Observable<([T]?, HTTPURLResponse?)> {
    
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
    
    
    return Observable
        .create{ observer in
            let _request = request(router).responseArray(keyPath: "tngou") { (response:DataResponse<[T]>) in
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                
                if response.result.error != nil  {
                    
                    observer.onError(response.result.error!)
                    
                } else {
                    observer.onNext((response.result.value, response.response))
                    observer.onCompleted()
                }
            }
            return Disposables.create {
                _request.cancel()
            }

    }
}
