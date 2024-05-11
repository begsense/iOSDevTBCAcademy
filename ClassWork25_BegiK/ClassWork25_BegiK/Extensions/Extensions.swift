//
//  Extensions.swift
//  ClassWork25_BegiK
//
//  Created by M1 on 11.05.2024.
//

import UIKit

extension UIButton {
    func createButton(name: String) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: name), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.tintColor = .white
        return button
    }
}
