//
//  TaskSection.swift
//  ToDoList
//
//  Created by Fernando on 09.06.18.
//  Copyright © 2018 Fernando. All rights reserved.
//

import Foundation

enum TaskSection: Int {
    case Now
    case Soon
    case Upcoming
    
    var title: String {
        switch self {
        case .Now: return "Now"
        case .Soon: return "Soon"
        case .Upcoming: return "Upcoming"
        }
    }
    
    static var numberOfSections: Int {
        return 3
    }
}

extension TaskSection {
    init(forTaskDueDate date: Date) {
        let numberOfDaysUntilTaskDueDate = date.intervalUntilNow(ofComponent: .day)
        switch numberOfDaysUntilTaskDueDate {
        case -Int.max...2:
            self = .Now
        case 3...5:
            self = .Soon
        default:
            self = .Upcoming
        }
    }
}
