//
//  DFTabbarViewController.swift
//  TodayNewsSwift
//
//  Created by zzf on 2017/6/7.
//  Copyright © 2017年 zzf. All rights reserved.
//

import UIKit

class DFTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.        
        self.createTabbarItem()
        self.tabBar.tintColor = UIColor.red
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createTabbarItem() {
        self.addItem(controller: DFHomeViewController(), title: "首页", image: "like", selectImage: "like_press")
        self.addItem(controller: DFMovieViewController(), title: "视频", image: "like", selectImage: "like_press")
        self.addItem(controller: DFMicroNewsViewController(), title: "微头条", image: "like", selectImage: "like_press")
        self.addItem(controller: DFMineViewController(), title: "我的", image: "like", selectImage: "like_press")
    }

    func addItem(controller: UIViewController, title: String, image: String, selectImage: String) {
        let nav = DFNavigationViewController.init(rootViewController: controller)
        controller.tabBarItem.image = UIImage.init(named: image)
        controller.tabBarItem.selectedImage = UIImage.init(named: selectImage)
        controller.title = title
        
        
        self.addChildViewController(nav)
    }
    
//    //1.分析 NSArray 是一个闭包的返回值，而这是一个没有参数的闭包
//    lazy var dataArray:NSArray = { [] }()
//    //2.也可以写成这样 lazy var dataArray:NSArray = { return NSArray() }()
//    
//    //3.从plist文件加载
//    lazy var dataArray:Array<XWWine> = {
//        let winePath = NSBundle.mainBundle().pathForResource("wine.plist", ofType: nil)!
//        let winesM = NSMutableArray(contentsOfFile: winePath);
//        var tmpArray:Array<XWWine>! = []
//        for tmpWineDict in winesM! {
//            var wine:XWWine = XWWine.wineWithDict(tmpWineDict as! NSDictionary)
//            tmpArray.append(wine)
//        }
//        print("我就运行一次")
//        return tmpArray }()

}
