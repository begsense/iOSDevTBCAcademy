//
//  DetailsVC.swift
//  ClassWork20_BegiK
//
//  Created by M1 on 21.04.2024.
//

import UIKit


class DetailsVC: UIViewController {
 
//MARK: Properties:
    var selectedDetails: country?
    
    let topView: UIView = {
        let topView = UIView()
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.heightAnchor.constraint(equalToConstant: 421).isActive = true
        return topView
    }()
    
    var countryName: UILabel = {
        let countryName = UILabel()
        countryName.translatesAutoresizingMaskIntoConstraints = false
        countryName.text = ""
        countryName.textColor = .black
        countryName.font = UIFont(name: "Arial", size: 17)
        return countryName
    }()
    
    var countryFlag: UIImageView = {
        let countryFlag = UIImageView()
        countryFlag.image = UIImage(named: "flag")
        countryFlag.translatesAutoresizingMaskIntoConstraints = false
        countryFlag.heightAnchor.constraint(equalToConstant: 228).isActive = true
        return countryFlag
    }()
  
//MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        loadImageFromJSON()
    }
    
//MARK: Funcs
    func setupUI() {
        if let selectedDetails = selectedDetails {
            countryName.text = selectedDetails.name.common
            countryFlag.image = UIImage(named: selectedDetails.flags.png)
        }
        view.addSubview(topView)
        topView.addSubview(countryName)
        topView.addSubview(countryFlag)
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.topAnchor, constant: 65),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            countryName.topAnchor.constraint(equalTo: topView.topAnchor, constant: 0),
            countryName.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            countryFlag.topAnchor.constraint(equalTo: countryName.bottomAnchor, constant: 29),
            countryFlag.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 0),
            countryFlag.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: 0)
        ])
    }
    
    func loadImageFromJSON() {
        guard let urlString = selectedDetails?.flags.png, let url = URL(string: urlString) else {
            print("Photo URL is nil")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error fetching image: \(error)")
                return
            }
            
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.countryFlag.image = image
                }
            }
        }.resume()
    }
    
}
