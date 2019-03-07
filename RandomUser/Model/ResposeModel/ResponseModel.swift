//
//  ResponseModel.swift
//  RandomUser
//
//  Created by AlexanderKogut on 3/6/19.
//  Copyright © 2019 AlexanderKogut. All rights reserved.
//

import Foundation
import HandyJSON

class Results: HandyJSON {
    var gender: String!
    var name: Name!
    var location: Location!
    var email: String!
    var login: Login!
    var registered: Registered!
    var phone: String!
    var cell: String!
    var picture: Picture!
    required init() {}
}

class Name: HandyJSON {
    var title: String!
    var first: String!
    var last: String!
    required init() {}
}

class Location: HandyJSON {
    var street: String!
    var city: String!
    var state: String!
    var postcode: Int!
    required init() {}
}

class Login: HandyJSON {
    var username: String!
    required init() {}
}

class Registered: HandyJSON {
    var date: String!
    var age: Int!
    required init() {}
}

class Picture: HandyJSON {
    var large: String!
    var medium: String!
    var thumbnail: String!
    required init() {}
}

class ResponseModel: HandyJSON {
    var results: [Results]!
    required init() {}
}
