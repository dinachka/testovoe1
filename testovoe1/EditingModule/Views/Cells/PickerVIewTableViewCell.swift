//
//  PickerVIewTableViewCell.swift
//  testovoe1
//
//  Created by Дина Черных on 10.07.23.
//

import UIKit

final class PickerViewTableViewCell: UITableViewCell {
    
    
    static var idPickerViewCell = "idPickerCell"

    private let nameLabel = UILabel()
    private let sexPickerView = SexPickerView()
    private let sexTextField = SexTextField()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        selectionStyle = .none
        nameLabel.font = Resources.Fonts.avenirNextRegular(wit: 18)

        addView(nameLabel)
        sexTextField.inputView = sexPickerView
        sexPickerView.sexDelegate = self
        contentView.addView(sexTextField)
    }
    
    public func configure(name: String, value: String) {
        nameLabel.text = name
        sexTextField.text = value
    }
    
    public func getCellValue() -> String {
        guard let text = sexTextField.text else { return "" }
        return text
    }
}

// MARK: - Set constraints

extension PickerViewTableViewCell {
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.35),
            
            sexTextField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            sexTextField.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10),
            sexTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -17),
            sexTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }
}

// MARK: - UITextViewDelegate

extension PickerViewTableViewCell: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
       
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Введите данные"
            textView.textColor = .lightGray
        }
    }
}


// MARK: - SexPickerViewProtocol

extension PickerViewTableViewCell: SexPickerViewProtocol {
    func didSelect(row: Int) {
        sexTextField.text = Resources.Sex.allCases[row].rawValue
        sexTextField.resignFirstResponder()
    }
    
    
}
