//
//  UIView + Extensions.swift
//  testovoe1
//
//  Created by Дина Черных on 04.07.23.
//

import UIKit

extension UIView {
    
    func addView(_ view: UIView) {
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}
