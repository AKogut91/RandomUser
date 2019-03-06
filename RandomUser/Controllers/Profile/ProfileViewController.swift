//
//  ProfileViewController.swift
//  RandomUser
//
//  Created by AlexanderKogut on 3/6/19.
//  Copyright © 2019 AlexanderKogut. All rights reserved.
//

import UIKit

extension ProfileViewController {
    enum CellType {
        case initials, adress, email, cellPhone, registered
    }
}

class ProfileViewController: UIViewController {
    
    @IBOutlet weak private var tableView: UITableView!
    
    private let cellSections:[CellType] = [.initials, .adress, .email, .cellPhone, .registered]
    
    override func loadView() {
        super.loadView()
        setNavigation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
    }
    
}

//MARK: - TableView
extension ProfileViewController {
    
    func setTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorInset.right = 20
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
        tableView.registerCellWithNib(cellID: GlobalCellid.nameAndPictureTableViewCell)
    }
}

//MARK: - Navigation
extension ProfileViewController {
    
    func setNavigation() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = Localization.Navigation.profile
    }
}

extension ProfileViewController: UITableViewDataSource ,UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cellSections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellRows = cellSections[indexPath.section]
        
        switch cellRows {
        case .initials:
            let cell = tableView.dequeueReusableCell(withIdentifier: GlobalCellid.nameAndPictureTableViewCell, for: indexPath) as! NameAndPictureTableViewCell
            return cell
        case .adress:
            return UITableViewCell()
        case .email:
            return UITableViewCell()
        case .cellPhone:
            return UITableViewCell()
        case .registered:
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let cellRows = cellSections[indexPath.section]
        
        switch cellRows{
        case .initials:
            return 325
        default:
            return UITableView.automaticDimension
        }
    }
}
