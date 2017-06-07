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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
