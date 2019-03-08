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
    private var helperView: HelperView!
    var viewModel: ProfileViewModel!
    
    override func loadView() {
        super.loadView()
        setNavigation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setHelperView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.backgroundColor()
        notification()
        startLoadingUser()
    }
    
    func startLoadingUser() {
        viewModel = ProfileViewModel(complition: {
            UIView.animate(withDuration: 0.33, animations: { [weak self] in
                self!.view.backgroundColor = UIColor.backgroundColor()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: { [weak self] in
                    self!.setTableView()
                    self!.removeHelperView()
                })
            })
        })
    }
}

//MARK: - Notification
extension ProfileViewController {
    
    func notification() {
        NotificationCenter.default.addObserver(self, selector: #selector(presentError), name: .requestError, object: nil)
    }
    
    @objc func presentError() {
        helperView.retryButton.addTarget(self, action: #selector(reloadTable), for: .touchUpInside)
        helperView.activityIndicator.stopAnimating()
        helperView.activityIndicator.isHidden = true
        helperView.retryButton.isHidden = false
        helperView.showErrorlabel()
    }
}

//MARK: - Loading View with activity indicator
extension ProfileViewController {
    
    func setHelperView() {
        helperView = HelperView(frame: .zero)
        helperView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(helperView, aboveSubview: tableView)
        NSLayoutConstraint.activate([
            
            helperView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            helperView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            helperView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            helperView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
            ])
    
        helperView.activityIndicator.startAnimating()
    }
    
    func removeHelperView() {
        helperView.activityIndicator.stopAnimating()
        helperView.removeFromSuperview()
    }
    
    @objc func reloadTable() {
        helperView.removeFromSuperview()
        setHelperView()
        startLoadingUser()
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
        
        let userData = viewModel.information
        
        switch cellRows {
        case .initials:
            let cell = tableView.dequeueReusableCell(withIdentifier: GlobalCellid.nameAndPictureTableViewCell, for: indexPath) as! NameAndPictureTableViewCell
            cell.configure(avatar: (userData?.userInitial.image)!,
                           firstName: (userData?.userInitial.firstName)!,
                           lastName: (userData?.userInitial.lastName)!,
                           nickName: (userData?.userInitial.nickName)!)
            return cell
            
        case .adress:
            let cell = tableView.dequeueReusableCell(withIdentifier: GlobalCellid.userInfoTableViewCell, for: indexPath) as! UserInfoTableViewCell
            cell.configuration(infoKey: Localization.UserInfoKeys.postalAdress,
                               infoValue: (userData?.userInfo.postalAddress)!)
            return cell
            
        case .email:
            let cell = tableView.dequeueReusableCell(withIdentifier: GlobalCellid.userInfoTableViewCell, for: indexPath) as! UserInfoTableViewCell
            cell.configuration(infoKey: Localization.UserInfoKeys.email,
                               infoValue: (userData?.userInfo.email)!)
            return cell
            
        case .cellPhone:
            let cell = tableView.dequeueReusableCell(withIdentifier: GlobalCellid.userInfoTableViewCell, for: indexPath) as! UserInfoTableViewCell
            cell.configuration(infoKey: Localization.UserInfoKeys.cell,
                               infoValue: (userData?.userInfo.cell)!)
            return cell
            
        case .registered:
            let cell = tableView.dequeueReusableCell(withIdentifier: GlobalCellid.userInfoTableViewCell,
                                                     for: indexPath) as! UserInfoTableViewCell
            cell.configuration(infoKey: Localization.UserInfoKeys.registered,
                               infoValue:(userData?.userInfo.register)! )
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
