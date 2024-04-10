//
//  aboutInfoVC.swift
//  ClassWork15_BegiK
//
//  Created by M1 on 10.04.2024.
//

import UIKit

class AboutInfoVC: UIViewController, colorChanger {
    func changeColor(color: UIColor) {
        mainStackView.backgroundColor = color
    }
    
    
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
    
    var topStackViewIcon = UIImageView(image: UIImage(named: "wtf"))
    
    var topStackViewName: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "სანამ სწორად მიუთითებ"
        name.numberOfLines = 0
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
    
    var bottomStackViewDescription: UITextView = {
        let description = UITextView()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.text = "სვანი ჩავიდა და ორი დღის მანძილზე აუზიდან არ ამოდის, სულ ყვინთაობს და ყვინთაობს. ბოლოს როგორც იქნა ამოძვრა და სასტუმროს მფლობელს ეკითხება, ამ ბასეინში კაფელი ვინ გააკეთა?! ? ვიღაც ჟორამ, ეუბნება პატრონი. ? სვანი: მაგარი დიხანიე კი ჰქონია და!?"
        description.font = UIFont(name: "Arial", size: 14)
        description.maximumZoomScale = .zero
        description.heightAnchor.constraint(equalToConstant: 150).isActive = true
        description.sizeToFit()
        description.textColor = .gray
        description.backgroundColor = .none
        return description
    }()
    
    let bottomStackButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .purple
        button.setTitle("პოლარული ნიშანი", for: .normal)
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
        buttonFunctional()
    }
    
    func addMainStackView() {
        view.addSubview(mainStackView)
        mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 55).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
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
        topStackView.addArrangedSubview(topStackViewIcon)
        topStackViewIcon.translatesAutoresizingMaskIntoConstraints = false
        topStackViewIcon.contentMode = .scaleAspectFit
        topStackViewIcon.widthAnchor.constraint(equalToConstant: 137).isActive = true
        topStackViewIcon.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: 20).isActive = true
        topStackView.addArrangedSubview(topStackViewName)
    }
    
    func addBottomContent() {
        bottomStackView.axis = .vertical
        bottomStackView.spacing = 46
        bottomStackView.addArrangedSubview(bottomStackViewDescription)
        bottomStackView.addArrangedSubview(bottomStackButton)
    }
    
    func buttonFunctional() {
        bottomStackButton.addTarget(self, action: #selector(changeToLastVC), for: .touchUpInside)
    }
    
    @objc func changeToLastVC() {
        let lastPageVC = LastPageVC()
        lastPageVC.delegate = self
        self.navigationController?.pushViewController(lastPageVC, animated: false)
        switch topStackViewName.text {
        case "Capricorn":
            lastPageVC.topViewName.text = capricorn.polarSign
            lastPageVC.topViewIcon = cancer.icon!
        case "Aries":
            lastPageVC.topViewName.text = aries.polarSign
            lastPageVC.topViewIcon = libra.icon!
        case "Taurus":
            lastPageVC.topViewName.text = taurus.polarSign
            lastPageVC.topViewIcon = scorpio.icon!
        case "Gemini":
            lastPageVC.topViewName.text = gemini.polarSign
            lastPageVC.topViewIcon = sagittarius.icon!
        case "Cancer":
            lastPageVC.topViewName.text = cancer.polarSign
            lastPageVC.topViewIcon = capricorn.icon!
        case "Leo":
            lastPageVC.topViewName.text = leo.polarSign
            lastPageVC.topViewIcon = aquarius.icon!
        case "Virgo":
            lastPageVC.topViewName.text = virgo.polarSign
            lastPageVC.topViewIcon = pisces.icon!
        case "Libra":
            lastPageVC.topViewName.text = libra.polarSign
            lastPageVC.topViewIcon = aries.icon!
        case "Scorpio":
            lastPageVC.topViewName.text = scorpio.polarSign
            lastPageVC.topViewIcon = taurus.icon!
        case "Sagittarius":
            lastPageVC.topViewName.text = sagittarius.polarSign
            lastPageVC.topViewIcon = gemini.icon!
        case "Aquarius":
            lastPageVC.topViewName.text = aquarius.polarSign
            lastPageVC.topViewIcon = leo.icon!
        case "Pisces":
            lastPageVC.topViewName.text = pisces.polarSign
            lastPageVC.topViewIcon = virgo.icon!
        default:
            print("")
        }
    }
}

#Preview {
    AboutInfoVC()
}
