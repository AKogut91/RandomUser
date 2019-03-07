//
//  Request.swift
//  RandomUser
//
//  Created by AlexanderKogut on 3/7/19.
//  Copyright © 2019 AlexanderKogut. All rights reserved.
//

import Foundation
import Alamofire

typealias JSONDictionary = [String: Any]

class Request {
    
    enum Links: String {
        case randomuser = "https://api.randomuser.me"
    }
    
    func apiRequest(link: Links, complition: @escaping (JSONDictionary) -> ()) {
        
        Alamofire.request(link.rawValue, method: .get)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                if (response.result.error == nil) {
                    debugPrint("HTTP Response Body: \(response.data!)")
                    
                    if let json = response.result.value {
                        complition(json as! JSONDictionary)
                    }
                }
                else {
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                       NotificationCenter.default.post(name: .requestError, object: nil)
                    })
                    
                    debugPrint("HTTP Request failed: \(response.result.error!)")
            }
        }
    }
}
