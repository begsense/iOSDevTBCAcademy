//
//  lastPageVC.swift
//  ClassWork15_BegiK
//
//  Created by M1 on 11.04.2024.
//

protocol colorChanger {
    func changeColor(color: UIColor)
}

import UIKit

class LastPageVC: UIViewController {
    
    var delegate: colorChanger?
    
    let mainStackView: UIStackView = {
        let mainStackView = UIStackView()
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        return mainStackView
    }()
    
    let topStackView: UIStackView = {
        let topStackView = UIStackView()
        topStackView.translatesAutoresizingMaskIntoConstraints = false
        return topStackView
    }()
    
    var topViewIcon = UIImageView(image: UIImage(named: "wtf"))
    
    var topViewName: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "სანამ სწორად მიუთითებ"
        name.textAlignment = .center
        name.textColor = .white
        name.font = UIFont(name: "Arial", size: 24)
        return name
    }()
    
    
    let bottomStackView: UIStackView = {
        let bottomStackView = UIStackView()
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        return bottomStackView
    }()
    
    let bottomStackButton1: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.setTitle("წითელი", for: .normal)
        button.layer.cornerRadius = 14
        button.heightAnchor.constraint(equalToConstant: 46).isActive = true
        return button
    } ()
    
    let bottomStackButton2: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.setTitle("ლურჯი", for: .normal)
        button.layer.cornerRadius = 14
        button.heightAnchor.constraint(equalToConstant: 46).isActive = true
        return button
    } ()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        addMainStackView()
        configureMainStackView()
        addTopContent()
        addBottomContent()
        buttonFunctional1()
        buttonFunctional2()
    }
    
    func addMainStackView() {
        view.addSubview(mainStackView)
        mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 65).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        mainStackView.spacing = 110
    }
    
    func configureMainStackView() {
        mainStackView.axis = .vertical
        mainStackView.addArrangedSubview(topStackView)
        mainStackView.addArrangedSubview(bottomStackView)
    }
    
    func addTopContent() {
        topStackView.axis = .vertical
        topStackView.alignment = .fill
        topStackView.spacing = 30
        topStackView.distribution = .fillProportionally
        topStackView.addArrangedSubview(topViewIcon)
        topStackView.addArrangedSubview(topViewName)
        topViewIcon.translatesAutoresizingMaskIntoConstraints = false
        topViewIcon.contentMode = .scaleAspectFit
        topViewIcon.widthAnchor.constraint(equalToConstant: 137).isActive = true
        topViewIcon.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: 20).isActive = true
    }
    
    
    func addBottomContent() {
        bottomStackView.axis = .vertical
        bottomStackView.spacing = 32
        bottomStackView.addArrangedSubview(bottomStackButton1)
        bottomStackView.addArrangedSubview(bottomStackButton2)
    }
    
    func buttonFunctional1() {
        bottomStackButton1.addTarget(self, action: #selector(changeColorRed), for: .touchUpInside)
    }
    
    func buttonFunctional2() {
        bottomStackButton2.addTarget(self, action: #selector(changeColorBlue), for: .touchUpInside)
    }
    
    @objc func changeColorRed() {
        delegate?.changeColor(color: .red)
    }
    
    @objc func changeColorBlue() {
        delegate?.changeColor(color: .blue)
    }
}

#Preview {
    LastPageVC()
}
