//
//  CustomCellForTableView.swift
//  ClassWork19_BegiK
//
//  Created by M1 on 19.04.2024.
//

import UIKit

class CustomCellForTableView: UITableViewCell {
    
//MARK: Properties:
    
    var newsTimeStack: UIStackView = {
        let newsTimeStack = UIStackView()
        newsTimeStack.translatesAutoresizingMaskIntoConstraints = false
        return newsTimeStack
    }()
    
    var newsTime: UILabel = {
        let newsTime = UILabel()
        newsTime.translatesAutoresizingMaskIntoConstraints = false
        newsTime.text = "11:11"
        newsTime.textColor = .white
        newsTime.font = UIFont(name: "Arial", size: 12)
        newsTime.numberOfLines = 0
        return newsTime
    }()
    
    var newsHeader: UILabel = {
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.text = "ტრულალას ფული აღარ უნდა"
        description.font = UIFont(name: "Arial", size: 14)
        description.textColor = .white
        description.numberOfLines = 0
        return description
    }()
  
//MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//MARK: SetupUI
    func setupUI() {
        addSubview(newsTimeStack)
        newsTimeStack.axis = .vertical
        newsTimeStack.alignment = .center
        newsTimeStack.distribution = .fill
        newsTimeStack.spacing = 12
        NSLayoutConstraint.activate([
            newsTimeStack.topAnchor.constraint(equalTo: topAnchor, constant: 36),
            newsTimeStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            newsTimeStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
        newsTimeStack.addArrangedSubview(newsTime)
        newsTimeStack.addArrangedSubview(newsHeader)
    }
    
}
