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
        tableView.registerCellWithNib(cellID: GlobalCellid.nameAndPictureTableViewCell)
        tableView.registerCellWithNib(cellID: GlobalCellid.userInfoTableViewCell)
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
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
            let cell = tableView.dequeueReusableCell(withIdentifier: GlobalCellid.userInfoTableViewCell, for: indexPath) as! UserInfoTableViewCell
            cell.configuration(infoKey: Localization.UserInfoKeys.postalAdress, infoValue: "")
            return cell
        case .email:
            let cell = tableView.dequeueReusableCell(withIdentifier: GlobalCellid.userInfoTableViewCell, for: indexPath) as! UserInfoTableViewCell
            cell.configuration(infoKey: Localization.UserInfoKeys.email, infoValue: "")
            return cell
        case .cellPhone:
            let cell = tableView.dequeueReusableCell(withIdentifier: GlobalCellid.userInfoTableViewCell, for: indexPath) as! UserInfoTableViewCell
            cell.configuration(infoKey: Localization.UserInfoKeys.cell, infoValue: "")
            return cell
        case .registered:
            let cell = tableView.dequeueReusableCell(withIdentifier: GlobalCellid.userInfoTableViewCell, for: indexPath) as! UserInfoTableViewCell
            cell.configuration(infoKey: Localization.UserInfoKeys.registered, infoValue: "")
            return cell
        }
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let cellRows = cellSections[indexPath.section]
        
        switch cellRows{
        case .initials:
            return 300
        default:
            return UITableView.automaticDimension
        }
    }
}
