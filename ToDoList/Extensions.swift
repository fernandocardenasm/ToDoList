//
//  Extensions.swift
//  ToDoList
//
//  Created by Fernando on 09.06.18.
//  Copyright © 2018 Fernando. All rights reserved.
//

import Foundation

extension String {
    
    var timestampSince1970: Double {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZ"
        return (dateFormatter.date(from: self)?.timeIntervalSince1970)!
    }
}

extension Double {
    var dateSince1970: Date {
        return Date(timeIntervalSince1970: self)
    }
}

extension Date {
    
    func plus(numberOfDays number: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: number, to: self)!
    }
    
    func intervalUntilNow(ofComponent comp: Calendar.Component) -> Int {

        let dateNow = Date()

        let currentCalendar = Calendar.current

        guard let start = currentCalendar.ordinality(of: comp, in: .era, for: dateNow) else { return 0 }
        guard let end = currentCalendar.ordinality(of: comp, in: .era, for: self) else { return 0 }

        return end - start
    }
    
    func daysAgoFromNow() -> String {
        
        let number = self.intervalUntilNow(ofComponent: .day)
        
        return abs(number) == 1 ? "\(number) day" : "\(number) days"
    }
    
}
