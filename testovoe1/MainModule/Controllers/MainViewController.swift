//
//  MainViewController.swift
//  testovoe1
//
//  Created by Дина Черных on 27.06.23.
//

import UIKit

final class MainViewController: UIViewController {
    
    private let userPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let mainTableView = MainTableView()

    private var userModel = UserModel()
    
    override func viewWillLayoutSubviews() {
        userPhotoImageView.layer.cornerRadius = userPhotoImageView.frame.width / 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
        getUserModel()
        setValueArray()
    }

    private func setupViews() {
        title = "Просмотр"
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Редактировать", style: .plain, target: self, action: #selector(didTappedEditing))
        view.addView(userPhotoImageView)
        view.addView(mainTableView)
    }
    
    @objc func didTappedEditing(_ sender: UIButton) {
        let editingTableVC = EditingViewController(userModel, userPhotoImageView.image)
        navigationController?.pushViewController(editingTableVC, animated: true)
    }
    
    private func getUserModel() {
        userModel = UserDefaultsHelper.getUserModel()
        let userPhoto = UserDefaultsHelper.loadUserImage()
        userPhotoImageView.image = userPhoto
    }
    
    private func saveEditModel(_ model: UserModel) {
        UserDefaultsHelper.saveUserValue(Resources.FieldNames.firstName.rawValue, model.firstName)
        UserDefaultsHelper.saveUserValue(Resources.FieldNames.lastName.rawValue, model.lastName)
        UserDefaultsHelper.saveUserValue(Resources.FieldNames.middleName.rawValue, model.middleName)
        UserDefaultsHelper.saveUserValue(Resources.FieldNames.birthdayDate.rawValue, model.birthdayDate)
        UserDefaultsHelper.saveUserValue(Resources.FieldNames.sex.rawValue, model.sex)
    }
    
    private func getValueArray() -> [String] {
        var valueArray = [String]()
        
        for key in Resources.FieldNames.allCases {
            let value = UserDefaultsHelper.getUserValue(key.rawValue)
            valueArray.append(value)
        }
        return valueArray
    }
    
    private func setValueArray() {
        let valueArray = getValueArray()
        mainTableView.setValueArray(valueArray)
        mainTableView.reloadData()
    }
    
    public func changeUserModel(model: UserModel) {
        saveEditModel(model)
        userModel = model
        setValueArray()
        mainTableView.reloadData()
    }

    public func changeUserPhoto(image: UIImage?) {
        userPhotoImageView.image = image
        guard let userPhoto = image else { return }
        UserDefaultsHelper.saveUserImage(image: userPhoto)
    }
}

// MARK: - Set constraints
extension MainViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            userPhotoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            userPhotoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userPhotoImageView.heightAnchor.constraint(equalToConstant: 100),
            userPhotoImageView.widthAnchor.constraint(equalToConstant: 100),
            
            mainTableView.topAnchor.constraint(equalTo: userPhotoImageView.bottomAnchor, constant: 10),
            mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            mainTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}
