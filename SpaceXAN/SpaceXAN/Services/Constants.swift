//
//  Constants.swift
//  SpaceXAN
//
//  Created by Doğanay Şahin on 2.07.2022.
//

import Foundation


enum Status{
    case successful
    case fail
    enum Image : String{
        case successImage = "checkmark.circle.fill"
        case failedImage = "multiply.circle.fill"
    }
    enum Text : String {
        case successText = "Successfuly"
        case failText = "Failed"
        
    }
}


extension String {
    func convertToDate() -> String{
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy HH:mm"
        dateFormatterPrint.timeZone = TimeZone(identifier: "UTC")
        let date: Date? = dateFormatterGet.date(from: self)
        
        return dateFormatterPrint.string(from: date!);
        
        
        
    }
}

extension Int{
    func calculateDates() -> String{
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let currentdate = Date()
        
        let dateComp = Calendar.current
        
        let duration = dateComp.dateComponents([.month, .day], from: date, to: currentdate)
        
        guard let durationDay = duration.day else {
            return ""
        }
        
        if durationDay > 30 {
            return "Today launch day"
        }else{
            return "\(durationDay + 1) days ago"
        }
        
    }
}
