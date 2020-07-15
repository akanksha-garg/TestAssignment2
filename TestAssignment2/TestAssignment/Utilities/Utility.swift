//
//  Utility.swift
//  TestAssignment
//
//  Created by Akanksha garg on 13/07/20.
//  Copyright © 2020 Akanksha garg. All rights reserved.
//

import Foundation
class Utility {
    
    class func remaningTime(_ startDate: Date?, end endDate: Date? = Date()) -> String? {
        
        var components: DateComponents?
        var days: Int
        var hour: Int
        var minutes: Int
        var durationString: String?
        
        if let startDate = startDate, let endDate = endDate {
            components = Calendar.current.dateComponents([.day, .hour, .minute], from: startDate, to: endDate)
        }
        days = components?.day ?? 0
        hour = components?.hour ?? 0
        minutes = components?.minute ?? 0
        
        if days > 0 {
            
            if days > 1 {
                durationString = "\(days) days"
            } else {
                durationString = "\(days) day"
            }
            return durationString
        }
        
        if hour > 0 {
            
            if hour > 1 {
                durationString = "\(hour) hours"
            } else {
                durationString = "\(hour) hour"
            }
            return durationString
        }
        
        if minutes > 0 {
            
            if minutes > 1 {
                durationString = "\(minutes) minutes"
            } else {
                durationString = "\(minutes) minute"
            }
            return durationString
        }
        
        return ""
    }
    
    static func timePassed(since givenDate: Date?) -> String? {
        var timeLeft = ""
        var seconds: Int? = nil
        if let givenDate = givenDate {
            seconds = Int(Date().timeIntervalSince(givenDate))
        }
        let days = Int(floor(Double(seconds ?? Int(0.0) / (3600 * 24))))
        if days != 0 {
            seconds! -= Int(Double(days * 3600)) * 24
        }
        let hours = Int(floor(Double(seconds ?? Int(0.0) / 3600)))
        if hours != 0 {
            seconds! -= Int(Double(hours)) * 3600
        }
        let minutes = Int(floor(Double(seconds ?? Int(0.0) / 60)))
        if minutes != 0 {
            seconds! -= Int(Double(minutes * 60))
        }
        if days != 0 {
            timeLeft += String(format: "%ld days", days * -1)
        }
        if hours != 0 {
            timeLeft += String(format: "%ld hr", hours * -1)
        }
        if minutes != 0 {
            timeLeft += String(format: "%ld min", minutes * -1)
        }
        if seconds != nil {
            timeLeft += String(format: "%lds", Int(seconds ?? 0) * -1)
        }
        return timeLeft
    }
    
    static func convertToDate(date: String, originalFormat: String) -> Date? {
        if !date.isEmpty {
            let dateOriginalFormat = DateFormatter()
            dateOriginalFormat.dateFormat = originalFormat
            let dateFromString = dateOriginalFormat.date(from: date)
            return dateFromString
        } else {
            return nil
        }
    }
}

