//
//  DFHomeViewController.swift
//  TodayNewsSwift
//
//  Created by zzf on 2017/6/7.
//  Copyright © 2017年 zzf. All rights reserved.
//

import UIKit
import HandyJSON

class DFHomeViewController: DFBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.blue
        self.view.addSubview(self.tableView)
        self.addData()
//        self.downloadData()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let webVc = DFBaseWebViewController()
        webVc.url = "https://m.wozaijia.com/designer/"
        self.navigationController?.pushViewController(webVc, animated: true)
    }
    
    func downloadData() {
        let string = "http://is.snssdk.com/api/news/feed/v53"
        
        HttpRequestDataTool.get(url: string, parameters: [:], success: { response in
            
            print("response:\n", response)
//            let content = (response["data"][0]["content"])
//            JSONSerialization.jsonObject(with: <#T##Data#>, options: <#T##JSONSerialization.ReadingOptions#>)
//            let data = response["data"][0]["content"]
            
//            JSONDeserializer.deserializeModelArrayFrom(json: response["data"])
//
        }) { error in
            print("error %@", error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addData() {
        for index in 0...10 {
//            self.dataArray
            let model = TestModel()
            model.name = "hello world\(index)"
            self.dataArray.add(model)
        }
        
        self.tableView.reloadData()
    }
    

    lazy var tableView: UITableView = {
        let width = self.view.frame.size.width
        let height = self.view.frame.size.height
        let frame = CGRect(x: 0.0, y: 64.0, width: width, height: height - 64.0)
        let tableView = UITableView.init(frame: frame, style: UITableViewStyle.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    lazy var dataArray: NSMutableArray = {
        let dataArray = NSMutableArray()
        return dataArray
    }()
}

extension DFHomeViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
}

extension DFHomeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = BaseNewsTableViewCell.dequeueFromTableView(tableView: tableView) as! BaseNewsTableViewCell
//        cell.setModel(object: ["name" : "hello world\(indexPath.row)"])
        let model = self.dataArray[indexPath.row]
        cell.setModel(model as! TestModel)
        return cell
    }
}
