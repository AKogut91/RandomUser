//
//  StringExtension.swift
//  RandomUser
//
//  Created by AlexanderKogut on 3/7/19.
//  Copyright © 2019 AlexanderKogut. All rights reserved.
//

import Foundation


extension StringProtocol {
    var firstUppercased: String {
        guard let first = first else { return "" }
        return String(first).uppercased() + dropFirst()
    }
    var firstCapitalized: String {
        guard let first = first else { return "" }
        return String(first).capitalized + dropFirst()
    }
}
