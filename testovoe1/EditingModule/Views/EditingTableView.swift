//
//  EditingTableView.swift
//  testovoe1
//
//  Created by Дина Черных on 10.07.23.
//

import UIKit

final class EditingTableView: UITableView {
    
    private var userModel = UserModel()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        register(TextViewTableViewCell.self)
        register(DatePickerTableViewCell.self)
        register(PickerViewTableViewCell.self)
        delegate = self
        dataSource = self

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setUserModel(_ model: UserModel) {
        userModel = model
    }
    
    public func editUserModel() {
        guard let firstNameCell = self.cellForRow(at: [0, 0]) as? TextViewTableViewCell,
                 let lastNameCell = self.cellForRow(at: [0, 1]) as? TextViewTableViewCell,
                 let middleNameCell = self.cellForRow(at: [0, 2]) as? TextViewTableViewCell,
                 let birthdayDateCell = self.cellForRow(at: [0, 3]) as? DatePickerTableViewCell,
                 let sexCell = self.cellForRow(at: [0, 4]) as? PickerViewTableViewCell else {
            return
        }
        userModel.firstName = firstNameCell.getCellValue()
        userModel.lastName = lastNameCell.getCellValue()
        userModel.middleName = middleNameCell.getCellValue()
        userModel.birthdayDate = birthdayDateCell.getCellValue()
        userModel.sex = sexCell.getCellValue()
    }
    
    public func getUserModel() -> UserModel {
        editUserModel()
        return userModel
    }
}

// MARK: - UITableViewDataSource

extension EditingTableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Resources.FieldNames.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let fieldName = Resources.FieldNames.allCases[indexPath.row].rawValue

        switch indexPath.row {
        case 0...2:
            guard let cell = self.dequeueReusableCell(TextViewTableViewCell.self) else {
                return UITableViewCell()
            }
            cell.nameTextViewDelegate = self
            
            switch indexPath.row {
            case 0:
                cell.configure(name: fieldName, scrollEnable: true, value: userModel.firstName)
            case 1:
                cell.configure(name: fieldName, scrollEnable: false, value: userModel.lastName)
            default:
                cell.configure(name: fieldName, scrollEnable: true, value: userModel.middleName)
            }
            return cell
        case 3:
            guard let cell = self.dequeueReusableCell(DatePickerTableViewCell.self) else {
                return UITableViewCell()
            }
            cell.configure(name: fieldName, date: userModel.birthdayDate.getDateFromString())
            return cell
            
        case 4:
            guard let cell = self.dequeueReusableCell(PickerViewTableViewCell.self) else {
                return UITableViewCell()
            }
            cell.configure(name: fieldName, value: userModel.sex)
            return cell
        default:
            return UITableViewCell()
        }
      
    }
}


// MARK: - UITableViewDelegate

extension EditingTableView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.row == 1 ? UITableView.automaticDimension : 44
    }
}

extension EditingTableView: nameTextViewProtocol {
    func changeSize() {
        beginUpdates()
        endUpdates()
    }
}
