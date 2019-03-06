//
//  UserInfoTableViewCell.swift
//  RandomUser
//
//  Created by AlexanderKogut on 3/6/19.
//  Copyright © 2019 AlexanderKogut. All rights reserved.
//

import UIKit

class UserInfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak private var infoKey: UILabel!
    @IBOutlet weak private var infoValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.infoKey.text = ""
        self.infoValue.text = ""
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if let context = UIGraphicsGetCurrentContext() {
            context.setStrokeColor(UIColor.lightGray.withAlphaComponent(0.4).cgColor)
            context.setLineWidth(1.4)
            context.move(to: CGPoint(x: 16, y: bounds.height))
            context.addLine(to: CGPoint(x: bounds.width - 16, y: bounds.height))
            context.strokePath()
        }
    }
    
    func configuration(infoKey: String, infoValue: String ) {
        self.infoKey.text = infoKey
        self.infoValue.text = infoValue
    }
}
