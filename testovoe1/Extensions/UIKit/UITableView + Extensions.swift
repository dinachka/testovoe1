//
//  UITableView + Extensions.swift
//  testovoe1
//
//  Created by Дина Черных on 10.07.23.
//

import UIKit

extension UITableView {
    
    func register(_ type: UITableViewCell.Type) {
        let className = String(describing: type)
        register(type, forCellReuseIdentifier: className)
    }
    
    func dequeueReusableCell<T>(_ type: T.Type) -> T? {
        
        let className = String(describing: type)
        return dequeueReusableCell(withIdentifier: className) as? T
    }
}
