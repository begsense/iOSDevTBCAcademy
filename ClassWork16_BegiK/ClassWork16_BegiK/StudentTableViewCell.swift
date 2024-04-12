//
//  StudentTableViewCell.swift
//  ClassWork16_BegiK
//
//  Created by M1 on 12.04.2024.
//

import UIKit

class StudentTableViewCell: UITableViewCell {
    
    let symbolImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    func addSymbolImage() {
        contentView.addSubview(symbolImageView)
        symbolImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        symbolImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        symbolImageView.widthAnchor.constraint(equalToConstant: 8).isActive = true
        symbolImageView.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }
    
}
