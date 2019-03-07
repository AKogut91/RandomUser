//
//  ProfileViewModel.swift
//  RandomUser
//
//  Created by AlexanderKogut on 3/7/19.
//  Copyright © 2019 AlexanderKogut. All rights reserved.
//

import Foundation
import UIKit

extension ProfileViewModel {
    
    struct AllInforamtionAboutUser {
        var userInitial: UserInitial!
        var userInfo: UserInfo!
    }
    
    struct UserInitial {
        var firstName = ""
        var lastName = ""
        var nickName = ""
        var image = ""
    }
    
    struct UserInfo {
        var postalAddress = ""
        var email = ""
        var cell = ""
        var register = ""
    }
}

class ProfileViewModel {
    private let networkRequest = Request()
    private var userData: ResponseModel!
    var information: AllInforamtionAboutUser!
    
    init(complition: @escaping () -> ()) {
        networkRequest.apiRequest(link: .randomuser) { (json) in
            self.parseJSON(json: json, complition: {
                complition()
            })
        }
    }
    
    private func parseJSON(json: JSONDictionary, complition: @escaping () -> ()) {
        userData = ResponseModel.deserialize(from: json)
        var gender = ""
        for user in userData.results {
            
            let postal = """
            \(user.location.postcode ?? 0) \(String(describing: user.location.state ?? "" ))
            \(user.location.city ?? "")
            \(user.location.street ?? "")
"""
            if user.gender == "male" {
                gender = "Mr."
            } else {
                gender = "Ms."
            }
            
            information = AllInforamtionAboutUser(userInitial:
                ProfileViewModel.UserInitial.init(firstName: gender + " " + user.name.first.capitalized,
                                                  lastName: user.name.last.capitalized,
                                                  nickName: user.login.username.capitalized,
                                                  image: user.picture.medium),
                                                  userInfo: ProfileViewModel.UserInfo.init(
                                                    postalAddress: postal.capitalized, email: user.email, cell: user.cell, register: DateService().makeDate(json: user.registered.date, timeFormat: .monthDayYear)))
        }
    
        complition()
    }
}
