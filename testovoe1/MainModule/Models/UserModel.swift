//
//  UserModel.swift
//  testovoe1
//
//  Created by Дина Черных on 10.07.23.
//

import Foundation

struct UserModel {
    var firstName = ""
    var lastName = ""
    var middleName = ""
    var birthdayDate = ""
    var sex = ""
    
    static func == (_ firstModel: UserModel, _ secondModel: UserModel) -> Bool {
        firstModel.firstName == secondModel.firstName &&
        firstModel.lastName == secondModel.lastName &&
        firstModel.middleName == secondModel.middleName &&
        firstModel.birthdayDate == secondModel.birthdayDate &&
        firstModel.sex == secondModel.sex
    }
}
