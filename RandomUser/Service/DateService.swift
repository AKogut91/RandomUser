//
//  DateService.swift
//  RandomUser
//
//  Created by AlexanderKogut on 3/7/19.
//  Copyright © 2019 AlexanderKogut. All rights reserved.
//

import Foundation

class DateService {
    
    enum KindTime: String {
        case hoursMinut = "h:mm a"
        case monthDay = "MMM d"
        case day = "EEEE"
        case monthDayYear = "MMM d yyyy"
        case yearMonthDayHHmm = "yyyy-MM-dd HH:mm"
    }
    
    static func timeStamp(unixTimestamp: Int, timeFormat: KindTime) -> String {
        
        let date = Date(timeIntervalSince1970: TimeInterval(unixTimestamp))
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = timeFormat.rawValue
        let strDate = dateFormatter.string(from: date)
        return strDate
    }
    
    func makeDate(json: String, timeFormat: KindTime) -> String {
        let oldDate = json.replacingOccurrences(of: "T", with: " ", options:.literal, range: nil)
        let fixedTimeForFormatter = oldDate.replacingOccurrences(of: "Z", with: " ", options:.literal, range: nil)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00")
        let date = dateFormatter.date(from: fixedTimeForFormatter)
        
        dateFormatter.dateFormat = timeFormat.rawValue
        let newDate = dateFormatter.string(from: date!)
        
        return newDate
    }
}
