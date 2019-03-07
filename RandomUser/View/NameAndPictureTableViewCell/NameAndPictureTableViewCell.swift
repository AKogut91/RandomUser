//
//  NameAndPictureTableViewCell.swift
//  RandomUser
//
//  Created by AlexanderKogut on 3/6/19.
//  Copyright © 2019 AlexanderKogut. All rights reserved.
//

import UIKit
import AlamofireImage

class NameAndPictureTableViewCell: UITableViewCell {

    @IBOutlet weak private var avatar: UIImageView!
    @IBOutlet weak private var firstName: UILabel!
    @IBOutlet weak private var lastName: UILabel!
    @IBOutlet weak private var nickName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.avatar.setCircle()
        selectionStyle = .none
    }

    func configure(avatar: String, firstName: String, lastName: String, nickName: String) {
        self.avatar.af_setImage(withURL: URL(string: avatar)!)
        self.firstName.text = firstName
        self.lastName.text = lastName
        self.nickName.text = nickName
    }
}
