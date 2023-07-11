//
//  String + Extensions.swift
//  testovoe1
//
//  Created by Дина Черных on 10.07.23.
//

import Foundation

extension String {
    
    func getDateFromString() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let date = dateFormatter.date(from: self) ?? Date()
        return date
    }
}
