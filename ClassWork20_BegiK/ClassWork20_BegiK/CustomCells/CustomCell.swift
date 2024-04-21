//
//  CustomCell.swift
//  ClassWork20_BegiK
//
//  Created by M1 on 21.04.2024.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    //MARK: Properties:
    let mainView: UIView = {
        let mainView = UIView()
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.layer.cornerRadius = 15
        mainView.layer.borderWidth = 1.5
        return mainView
    }()
    
    var flag: UIImageView = {
        let flag = UIImageView()
        flag.image = UIImage(named: "flag")
        flag.translatesAutoresizingMaskIntoConstraints = false
        flag.widthAnchor.constraint(equalToConstant: 30).isActive = true
        flag.heightAnchor.constraint(equalToConstant: 20).isActive = true
        return flag
    }()
    
    let name: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "Georgia"
        name.textColor = .black
        name.font = UIFont(name: "SF Pro", size: 14)
        return name
    }()
    
    var symbol: UIImageView = {
        let symbol = UIImageView()
        symbol.image = UIImage(named: "symbol")
        symbol.translatesAutoresizingMaskIntoConstraints = false
        return symbol
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
        addSubview(mainView)
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            mainView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            mainView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            mainView.heightAnchor.constraint(equalToConstant: 50)
        ])
        mainView.addSubview(flag)
        mainView.addSubview(name)
        mainView.addSubview(symbol)
        NSLayoutConstraint.activate([
            flag.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 24),
            flag.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 15),
            flag.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -15),
            symbol.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -24),
            symbol.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20),
            symbol.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -20),
            name.trailingAnchor.constraint(equalTo: symbol.leadingAnchor, constant: -5),
            name.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 17),
            name.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -16)
        ])
    }
    
//    func setFlagImage(from urlString: String) {
//        guard let url = URL(string: urlString) else { return }
//        DispatchQueue.global().async { [weak self] in
//            if let data = try? Data(contentsOf: url),
//               let image = UIImage(data: data) {
//                DispatchQueue.main.async {
//                    self?.flag.image = image
//                }
//            }
//        }
//    }
    func setFlagImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let data = data, let image = UIImage(data: data) else {
                print("Failed to load image:", error ?? "Unknown error")
                return
            }
            
            DispatchQueue.main.async {
                self?.flag.image = image
            }
        }
        
        task.resume()
    }
    
}
