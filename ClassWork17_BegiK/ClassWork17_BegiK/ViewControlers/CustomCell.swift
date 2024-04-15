//
//  CustomCell.swift
//  ClassWork17_BegiK
//
//  Created by M1 on 14.04.2024.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
//MARK: Properties:
    let cardStackView: UIStackView = {
        let cardStackView = UIStackView()
        cardStackView.translatesAutoresizingMaskIntoConstraints = false
        return cardStackView
    }()
    
    var icon: UIImageView = {
       let icon = UIImageView()
        icon.image = UIImage(named: "icon1")
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    let cardsSubView: UIView = {
        let cardsSubView = UIView()
        cardsSubView.translatesAutoresizingMaskIntoConstraints = false
        return cardsSubView
    }()
    
    let header: UILabel = {
        let header = UILabel()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.text = cards[0].header
        header.textColor = .white
        header.font = UIFont(name: "FiraGO-BookItalic", size: 16)
        header.numberOfLines = 0
        return header
    }()
    
    let descr: UILabel = {
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.text = cards[0].description
        description.font = UIFont(name: "FiraGO-BookItalic", size: 10)
        description.textColor = UIColor(red: 94/255, green: 98/255, blue: 114/255, alpha: 1)
        description.numberOfLines = 0
        return description
    }()
  
//MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
//MARK: SetupUI
    func setupUI() {
        addSubview(cardStackView)
        cardStackView.axis = .vertical
        cardStackView.alignment = .leading
        cardStackView.distribution = .fill
        cardStackView.spacing = 12
        NSLayoutConstraint.activate([
            cardStackView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            cardStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cardStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            cardStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
        cardStackView.addArrangedSubview(icon)
        icon.widthAnchor.constraint(equalToConstant: 40).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 40).isActive = true
        cardStackView.addArrangedSubview(cardsSubView)
        cardsSubView.addSubview(header)
        cardsSubView.addSubview(descr)
        NSLayoutConstraint.activate([
            header.leadingAnchor.constraint(equalTo: cardsSubView.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: cardsSubView.trailingAnchor),
            header.topAnchor.constraint(equalTo: cardsSubView.topAnchor),
            descr.leadingAnchor.constraint(equalTo: cardsSubView.leadingAnchor),
            descr.trailingAnchor.constraint(equalTo: cardsSubView.trailingAnchor),
            descr.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 2)
        ])

    }
    
}

