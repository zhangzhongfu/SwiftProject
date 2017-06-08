//
//  BaseNewsTableViewCell.swift
//  TodayNewsSwift
//
//  Created by zzf on 2017/6/8.
//  Copyright © 2017年 zzf. All rights reserved.
//

import UIKit

class BaseNewsTableViewCell: DFBaseTableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func createSubView() {
        super.createSubView()
        
        self.contentView.addSubview(self.nameLabel)
        self.contentView.addSubview(self.iconImageView)
    }
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel(frame: CGRect.zero)
        nameLabel.font = UIFont.systemFont(ofSize: 14)
        nameLabel.textColor = UIColor.red
        nameLabel.text = "我是测试人员"
        return nameLabel
    }()
    
    lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView.init()
        iconImageView.backgroundColor = UIColor.blue
        iconImageView.layer.cornerRadius = 15.0
        iconImageView.layer.masksToBounds = true
        return iconImageView
    }()
    
    public func setModel(_ object: TestModel)  {
//        self.iconImageView.image = UIImage(named: "")
        self.nameLabel.text = object.name
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.iconImageView.frame = CGRect(x:10.0, y: 10.0, width: 30.0, height: 30.0)
        
        self.nameLabel.frame = CGRect(x:45.0, y: 10.0, width: 80.0, height: 20.0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
