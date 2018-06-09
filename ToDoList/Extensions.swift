//
//  Extensions.swift
//  ToDoList
//
//  Created by Fernando on 09.06.18.
//  Copyright © 2018 Fernando. All rights reserved.
//

import Foundation

extension String {
    
    var timestampSince1970: Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZ"
        return Int((dateFormatter.date(from: self)?.timeIntervalSince1970)!)
    }
    
}
