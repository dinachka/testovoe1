//
//  UserDefaultsHelper.swift
//  testovoe1
//
//  Created by Дина Черных on 10.07.23.
//

import UIKit

final class UserDefaultsHelper {
    
    private static let defaults = UserDefaults.standard
    private static let userSessionKey = "userKey"
    
    static func getUserDictionary() -> [String: String] {
        defaults.value(forKey: userSessionKey) as? [String: String] ?? [:]
    }
    
    static func saveUserValue(_ key: String, _ value: String) {
        var userDictionary = getUserDictionary()
        userDictionary[key] = value
        defaults.set(userDictionary, forKey: userSessionKey)
    }
    
    static func getUserModel() -> UserModel {
        var userModel = UserModel()
        let userDictionary = getUserDictionary()
        
        userModel.firstName = userDictionary[Resources.FieldNames.firstName.rawValue] ?? ""
        userModel.lastName = userDictionary[Resources.FieldNames.lastName.rawValue] ?? ""
        userModel.middleName = userDictionary[Resources.FieldNames.middleName.rawValue] ?? ""
        userModel.birthdayDate = userDictionary[Resources.FieldNames.birthdayDate.rawValue] ?? ""
        userModel.sex = userDictionary[Resources.FieldNames.sex.rawValue] ?? ""

        return userModel
    }
    
    static func getUserValue(_ key: String) -> String {
        let userDictionary = getUserDictionary()
        let stringValue = userDictionary[key] ?? ""
        return stringValue
    }
    
    static func saveUserImage(image: UIImage) {
        guard let data = image.jpegData(compressionQuality: 0.5) else { return }
        defaults.set(data, forKey: "userPhoto")
    }
    
    static func loadUserImage() -> UIImage {
        guard let data = defaults.data(forKey: "userPhoto"),
              let image = UIImage(data: data) else { return UIImage() }
        return image
    }
}
