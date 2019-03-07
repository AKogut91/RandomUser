//
//  NavigationProfileViewController.swift
//  RandomUser
//
//  Created by AlexanderKogut on 3/6/19.
//  Copyright © 2019 AlexanderKogut. All rights reserved.
//

import UIKit

class NavigationProfileViewController: UINavigationController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         self.setNeedsStatusBarAppearanceUpdate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

