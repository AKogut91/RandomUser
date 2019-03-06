//
//  ProfileViewController.swift
//  RandomUser
//
//  Created by AlexanderKogut on 3/6/19.
//  Copyright © 2019 AlexanderKogut. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func loadView() {
        super.loadView()
        setNavigation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

//MARK: - Navigation
extension ProfileViewController {
    
    func setNavigation() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = Localization.Navigation.profile
    }
}

