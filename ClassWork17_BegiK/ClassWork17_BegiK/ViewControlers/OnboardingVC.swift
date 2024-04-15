//
//  OnboardingVC.swift
//  ClassWork17_BegiK
//
//  Created by M1 on 14.04.2024.
//

import UIKit

class OnboardingVC: UIViewController {
    
 //MARK: Properties
    let backgroundImage: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "backgroundImage")
        image.contentMode = .scaleToFill
        return image
    }()
    
    let startingHeader: UILabel = {
        let header = UILabel()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.text = "შედი   აპლიკაციაში       და იწუწუნე რამდენიც გინდა"
        header.textColor = .white
        header.font = UIFont(name: "FiraGO-BookItalic", size: 30)
        header.numberOfLines = 0
        header.widthAnchor.constraint(equalToConstant: 263).isActive = true
        return header
    }()
    
    let startButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0/255, green: 117/255, blue: 255/255, alpha: 1.0)
        button.setTitle("დაწყება", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = UIFont(name: "FiraGO-BookItalic", size: 16)
        button.layer.cornerRadius = 15
        button.isEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 48).isActive = true
        button.widthAnchor.constraint(equalToConstant: 123).isActive = true
        return button
    }()

//MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        SetupUI()
        buttonAction()
    }
    
//MARK: SetupUI
    func SetupUI() {
        view.addSubview(backgroundImage)
        backgroundImage.addSubview(startingHeader)
        view.addSubview(startButton)
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            startingHeader.topAnchor.constraint(equalTo: backgroundImage.topAnchor, constant: 382),
            startingHeader.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor, constant: 21),
            startButton.bottomAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: -98),
            startButton.trailingAnchor.constraint(equalTo: backgroundImage.trailingAnchor, constant: -30)
        ])
    }

//MARK: Button functional
    
    func buttonAction() {
        let action = UIAction { [weak self] _ in
            self?.nextPageGeneration()
        }
        startButton.addAction(action, for: .touchUpInside)
    }
    
    func nextPageGeneration() {
        let mainPageVC = MainPageVC()
        self.navigationController?.pushViewController(mainPageVC, animated: false)
    }

}
