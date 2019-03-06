//
//  Localization.swift
//  RandomUser
//
//  Created by AlexanderKogut on 3/6/19.
//  Copyright © 2019 AlexanderKogut. All rights reserved.
//

import Foundation

final class Localization {
    
    public struct Navigation {
        ///Профиль
        static let profile = NSLocalizedString("Profile", comment: "Профиль")
    }
    
    public struct UserInfoKeys {
        ///Почтовый адрес
        static let postalAdress = NSLocalizedString("Postal Address", comment: "Почтовый адрес")
        ///Эл. почта
        static let email = NSLocalizedString("E-mail", comment: "Эл. почта")
        ///Телефон
        static let cell = NSLocalizedString("Cell", comment: "Телефон")
        ///Зарегистрированный
        static let registered = NSLocalizedString("Registered", comment: "Зарегистрированный")
    }
}
