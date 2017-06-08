//
//  DFNewsModel.swift
//  TodayNewsSwift
//
//  Created by zzf on 2017/6/7.
//  Copyright © 2017年 zzf. All rights reserved.
//

import UIKit

class DFNewsModel: DFBaseModel {
    
    //ID
    var totalNumber : NSInteger?
    //总数
    var hasMore : Bool?
    //名字
    var data : [NewsContent] = []

    var hasMoreToRefresh : Bool?
    
    var postContentHint : String?
    var message : String?
    
    var tips : Tips?
    
    
}


class Tips: DFBaseModel {
    var displayTemplate : String?
    var displayInfo : String?
    var appName : String?
    var packageName : String?
    
}

class NewsContent: DFBaseModel {
    var content : String?
    var code : String?
}
