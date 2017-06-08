//
//  HttpRequestDataTool.swift
//  TodayNewsSwift
//
//  Created by zzf on 2017/6/7.
//  Copyright © 2017年 zzf. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

typealias SuccessBlock = (_ object: AnyObject) -> ()
typealias FailureBlock = (_ error: NSError) -> ()

class HttpRequestDataTool: NSObject {
    
    class func get(url: String, parameters:[String: AnyObject]? = nil, success: @escaping SuccessBlock, failure: @escaping FailureBlock) {
        Alamofire.request(url, parameters: parameters, encoding: URLEncoding(destination: .methodDependent)).responseJSON { response in
            switch response.result {
                case .success:
                    if let value = response.result.value {
                        success(value as AnyObject)
                    }
                    else {
                        failure(NSError())
                    }
                case .failure:
                    failure(response.error! as NSError)
            }
        }
    }

}
