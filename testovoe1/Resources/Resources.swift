//
//  Resources.swift
//  testovoe1
//
//  Created by Дина Черных on 04.07.23.
//

import UIKit

enum Resources {
    
    enum FieldNames: String, CaseIterable {
        case firstName = "Имя"
        case lastName = "Фамилия"
        case middleName = "Отчество"
        case birthdayDate = "Дата рождения"
        case sex = "Пол"
    }
    
    enum Fonts {
        static func avenirNextRegular(wit size: CGFloat) -> UIFont? {
            UIFont(name: "Avenir Next", size: size)
        }
    }
    
    enum Sex: String, CaseIterable {
        case noSpecified = "не указано"
        case male = "Мужской"
        case female = "Женский"
    }
}
