//
//  MainPageTableViewCell.swift
//  ClassWork23_BegiK
//
//  Created by M1 on 02.05.2024.
//

import UIKit

class MainPageTableViewCell: UITableViewCell {
    //MARK: Properties:
    
    static let identifier = "CountryTableViewCell"
    
    var cellLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor.white
        label.numberOfLines = 0
        return label
    }()
    
    //MARK: Lifecycle:
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: SetupUI:
    
    func setupUI() {
        backgroundColor = .black
        contentView.addSubview(cellLabel)
        contentView.layer.cornerRadius = 15
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.gray.cgColor
        let padding: CGFloat = 8
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: 80),
            cellLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            cellLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            contentView.trailingAnchor.constraint(equalTo: cellLabel.trailingAnchor, constant: padding),
            contentView.bottomAnchor.constraint(greaterThanOrEqualTo: cellLabel.bottomAnchor, constant: padding)
        ])
    }
    
}
