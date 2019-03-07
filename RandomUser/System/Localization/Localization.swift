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
    
    public struct Loading {
        ///Загрузка
        static let loading = NSLocalizedString("Loading", comment: "Загрузка")
    }
    
    public struct Errors {
        ///Ошибка загрузки
        static let failedToLoading = NSLocalizedString("Failed to load", comment: "Ошибка загрузки")
        ///Нажмите, чтобы повторить попытку
        static let tapToRetry = NSLocalizedString("Tap to retry", comment: "Нажмите, чтобы повторить попытку")
    }
}
