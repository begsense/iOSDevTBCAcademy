//
//  MainVC.swift
//  ClassWork15_BegiK
//
//  Created by M1 on 10.04.2024.
//

import UIKit

class MainVC: UIViewController {
    //ინგლისურად მაქვს ტესტირებისდროს რომ გაითვალისწინოთ. ტექსტების გადმოქართულება დამეზარა ვიკიპედიადან ამოვიღე და ბარემ დასახელებებიც eng . ps აიქონების ხარისხის გამო ს2
    
//MARK: - Properties
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
    
    let bottomStackView: UIStackView = {
        let botStackView = UIStackView()
        botStackView.translatesAutoresizingMaskIntoConstraints = false
        return botStackView
    }()
    
    let topStackHeader: UILabel = {
        let header = UILabel()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.text = "მიშა ცაგარელის ჰაბი"
        header.textColor = .white
        header.font = UIFont(name: "Arial", size: 24)
        return header
    }()
    
    let topStackDescription: UILabel = {
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.text = "მოცემულ აპლიკაციაში შეგიძლიათ გაიგოთ თქვენი ზოდიაქოს ყველაზე გამოკვეთილი უნარები და თვისებები."
        description.font = UIFont(name: "Arial", size: 16)
        description.textColor = .gray
        description.numberOfLines = 0
        return description
    }()
    
    let bottomSubStackView: UIStackView = {
        let bottomSubStackView = UIStackView()
        bottomSubStackView.translatesAutoresizingMaskIntoConstraints = false
        return bottomSubStackView
    }()
    
    let botStackHeader: UILabel = {
        let botStackHeader = UILabel()
        botStackHeader.translatesAutoresizingMaskIntoConstraints = false
        botStackHeader.text = "ზოდიაქოს სახელი"
        botStackHeader.textColor = .white
        botStackHeader.font = UIFont(name: "Arial", size: 12)
        return botStackHeader
    }()
    
    let botStackField: UITextField = {
        let botStackField = UITextField()
        botStackField.translatesAutoresizingMaskIntoConstraints = false
        botStackField.placeholder = "მაგ: Capricorn"
        botStackField.font = UIFont(name: "Arial", size: 12)
        botStackField.borderStyle = .roundedRect
        botStackField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        return botStackField
    } ()
    
    let botStackButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .purple
        button.setTitle("შესვლა", for: .normal)
        button.layer.cornerRadius = 14
        button.heightAnchor.constraint(equalToConstant: 46).isActive = true
        return button
    } ()
    
    

//MARK: - DidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        addMainStackView()
        configureMainStackView()
        addTopContent()
        addBottomContent()
        buttonFunctional()
    }

//MARK: Methods
    func addMainStackView() {
        view.addSubview(mainStackView)
        mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 71).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        mainStackView.heightAnchor.constraint(equalToConstant: 375).isActive = true
    }
    
    func configureMainStackView() {
        mainStackView.axis = .vertical
        mainStackView.alignment = .fill
        mainStackView.distribution = .fillProportionally
        mainStackView.spacing = 91
        mainStackView.addArrangedSubview(topStackView)
        mainStackView.addArrangedSubview(bottomStackView)
    }
    
    func addTopContent() {
        topStackView.axis = .vertical
        topStackView.alignment = .fill
        topStackView.distribution = .fillProportionally
        topStackView.spacing = 20
        topStackView.addArrangedSubview(topStackHeader)
        topStackView.addArrangedSubview(topStackDescription)
    }
    
    func addBottomContent() {
        bottomStackView.axis = .vertical
        bottomStackView.addArrangedSubview(bottomSubStackView)
        bottomStackView.addArrangedSubview(botStackButton)
        bottomSubStackView.axis = .vertical
        bottomStackView.alignment = .fill
        bottomStackView.distribution = .fillProportionally
        bottomStackView.spacing = 20
        bottomSubStackView.addArrangedSubview(botStackHeader)
        bottomSubStackView.addArrangedSubview(botStackField)
    }
    
    func buttonFunctional() {
        botStackButton.addTarget(self, action: #selector(changeVC), for: .touchUpInside)
    }
    
    @objc func changeVC() {
        let aboutInfoVC = AboutInfoVC()
        self.navigationController?.pushViewController(aboutInfoVC, animated: false)
        switch botStackField.text {
        case "Capricorn":
            aboutInfoVC.topStackViewIcon = capricorn.icon!
            aboutInfoVC.topStackViewName.text = capricorn.name
            aboutInfoVC.bottomStackViewDescription.text = capricorn.description
        case "Aries":
            aboutInfoVC.topStackViewIcon = aries.icon!
            aboutInfoVC.topStackViewName.text = aries.name
            aboutInfoVC.bottomStackViewDescription.text = aries.description
        case "Taurus":
            aboutInfoVC.topStackViewIcon = taurus.icon!
            aboutInfoVC.topStackViewName.text = taurus.name
            aboutInfoVC.bottomStackViewDescription.text = taurus.description
        case "Gemini":
            aboutInfoVC.topStackViewIcon = gemini.icon!
            aboutInfoVC.topStackViewName.text = gemini.name
            aboutInfoVC.bottomStackViewDescription.text = gemini.description
        case "Cancer":
            aboutInfoVC.topStackViewIcon = cancer.icon!
            aboutInfoVC.topStackViewName.text = cancer.name
            aboutInfoVC.bottomStackViewDescription.text = cancer.description
        case "Leo":
            aboutInfoVC.topStackViewIcon = leo.icon!
            aboutInfoVC.topStackViewName.text = leo.name
            aboutInfoVC.bottomStackViewDescription.text = leo.description
        case "Virgo":
            aboutInfoVC.topStackViewIcon = virgo.icon!
            aboutInfoVC.topStackViewName.text = virgo.name
            aboutInfoVC.bottomStackViewDescription.text = virgo.description
        case "Libra":
            aboutInfoVC.topStackViewIcon = libra.icon!
            aboutInfoVC.topStackViewName.text = libra.name
            aboutInfoVC.bottomStackViewDescription.text = libra.description
        case "Scorpio":
            aboutInfoVC.topStackViewIcon = scorpio.icon!
            aboutInfoVC.topStackViewName.text = scorpio.name
            aboutInfoVC.bottomStackViewDescription.text = scorpio.description
        case "Sagittarius":
            aboutInfoVC.topStackViewIcon = sagittarius.icon!
            aboutInfoVC.topStackViewName.text = sagittarius.name
            aboutInfoVC.bottomStackViewDescription.text = sagittarius.description
        case "Aquarius":
            aboutInfoVC.topStackViewIcon = aquarius.icon!
            aboutInfoVC.topStackViewName.text = aquarius.name
            aboutInfoVC.bottomStackViewDescription.text = aquarius.description
        case "Pisces":
            aboutInfoVC.topStackViewIcon = pisces.icon!
            aboutInfoVC.topStackViewName.text = pisces.name
            aboutInfoVC.bottomStackViewDescription.text = pisces.description
        default:
            print("")
        }
    }
        
    
}



#Preview {
    MainVC()
}
