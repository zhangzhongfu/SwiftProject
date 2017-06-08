//
//  DFBaseTableViewCell.swift
//  TodayNewsSwift
//
//  Created by zzf on 2017/6/8.
//  Copyright © 2017年 zzf. All rights reserved.
//

import UIKit

class DFBaseTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public class func dequeueFromTableView(tableView: UITableView) -> DFBaseTableViewCell {
        let classString = NSStringFromClass(DFBaseTableViewCell.classForCoder())
        return tableView.dequeueReusableCell(withIdentifier: classString) as! DFBaseTableViewCell
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {

        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.createSubView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func createSubView() {
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
