//
//  Theme.swift
//  RandomUser
//
//  Created by AlexanderKogut on 3/6/19.
//  Copyright © 2019 AlexanderKogut. All rights reserved.
//

import Foundation
import UIKit

final class Theme {
    
    static func navigationBarColor() {
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = UIColor.navigationColor()
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}
