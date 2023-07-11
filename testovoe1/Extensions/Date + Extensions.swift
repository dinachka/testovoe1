//
//  Date + Extensions.swift
//  testovoe1
//
//  Created by Дина Черных on 10.07.23.
//

import Foundation

extension Date {
    
    func getStringFromDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let date = dateFormatter.string(from: self)
        return date
    }
}
