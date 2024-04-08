//
//  ViewController.swift
//  ClassWork14_BegiK
//
//  Created by M1 on 07.04.2024.
//

import UIKit

class ViewController: UIViewController {
// MARK: - Properties
    let mainStackView: UIStackView = {
        let mainStackView = UIStackView()
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        return mainStackView
    } ()
    
    let bottomStackView: UIStackView = {
        let bottomStackView = UIStackView()
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        return bottomStackView
    } ()
    
    let middleStackView: UIStackView = {
        let middleStackView = UIStackView()
        middleStackView.translatesAutoresizingMaskIntoConstraints = false
        return middleStackView
    } ()
    
    let topStackView: UIStackView = {
        let topStackView = UIStackView()
        topStackView.translatesAutoresizingMaskIntoConstraints = false
        return topStackView
    } ()
    
    let lockImage = UIImageView(image: UIImage(named: "images"))
    
    let middleViewHeading: UILabel = {
        let heading = UILabel()
        heading.text = "მოგესალმებით!"
        heading.font = UIFont(name: "Arial", size: 25)
        heading.translatesAutoresizingMaskIntoConstraints = false
        return heading
    } ()
    
    let middleViewParagraph: UILabel = {
        let paragraph = UILabel()
        paragraph.text = "ამ აპლიკაციის გამოყენების საუკეთესო გზა თქვენს ანგარიშზე შესვლაა, თუ არ გაქვთ ანგარიში გააკეთეთ, თუ არ გსურთ გაკეთება დასტოვეთ აქაურობა და წაშალეთ აპლიკაცია.!"
        paragraph.numberOfLines = 0
        paragraph.lineBreakMode = .byWordWrapping
        paragraph.font = UIFont(name: "Arial", size: 14)
        paragraph.translatesAutoresizingMaskIntoConstraints = false
        return paragraph
    } ()
    
    let tabMenu: UIStackView = {
        let tabMenu = UIStackView()
        tabMenu.translatesAutoresizingMaskIntoConstraints = false
        tabMenu.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return tabMenu
    } ()
    
    let tabMenuLabel: UILabel = {
        let tabMenuLabel = UILabel()
        tabMenuLabel.translatesAutoresizingMaskIntoConstraints = false
        tabMenuLabel.text = "ავტორიზაცია"
        tabMenuLabel.font = UIFont(name: "Arial", size: 14)
        tabMenuLabel.textAlignment = .center
        return tabMenuLabel
    } ()
    
    let tabMenuView: UIView = {
        let tabMenuView = UIView()
        tabMenuView.translatesAutoresizingMaskIntoConstraints = false
        tabMenuView.backgroundColor = .blue
        tabMenuView.layer.cornerRadius = 14
        tabMenuView.heightAnchor.constraint(equalToConstant: 2.5).isActive = true
        return tabMenuView
    } ()
    
    let signInForm: UIStackView = {
        let signInForm = UIStackView()
        signInForm.translatesAutoresizingMaskIntoConstraints = false
        return signInForm
    } ()
    
    let inputForm: UIStackView = {
        let inputForm = UIStackView()
        inputForm.translatesAutoresizingMaskIntoConstraints = false
        return inputForm
    } ()
    
    let firstForm: UIStackView = {
        let firstForm = UIStackView()
        firstForm.translatesAutoresizingMaskIntoConstraints = false
        firstForm.heightAnchor.constraint(equalToConstant: 68).isActive = true
        return firstForm
    } ()
    
    let firstFormText: UILabel = {
        let firstFormText = UILabel()
        firstFormText.translatesAutoresizingMaskIntoConstraints = false
        firstFormText.text = "სრული სახელი"
        firstFormText.font = UIFont(name: "Arial", size: 12)
        firstFormText.heightAnchor.constraint(equalToConstant: 20).isActive = true
        return firstFormText
    } ()
    
    let firstFormField: UITextField = {
        let firstFormField = UITextField()
        firstFormField.translatesAutoresizingMaskIntoConstraints = false
        firstFormField.placeholder = "მაგ: ქეთინო ფერი"
        firstFormField.font = UIFont(name: "Arial", size: 12)
        firstFormField.borderStyle = .roundedRect
        firstFormField.heightAnchor.constraint(equalToConstant: 20).isActive = true
        return firstFormField
    } ()
    
    let secondForm: UIStackView = {
        let secondForm = UIStackView()
        secondForm.translatesAutoresizingMaskIntoConstraints = false
        secondForm.heightAnchor.constraint(equalToConstant: 68).isActive = true
        return secondForm
    } ()
    
    let secondFormText: UILabel = {
        let secondFormText = UILabel()
        secondFormText.translatesAutoresizingMaskIntoConstraints = false
        secondFormText.text = "ელ. ფოსტა"
        secondFormText.font = UIFont(name: "Arial", size: 12)
        secondFormText.heightAnchor.constraint(equalToConstant: 20).isActive = true
        return secondFormText
    } ()
    
    let secondFormField: UITextField = {
        let secondFormField = UITextField()
        secondFormField.translatesAutoresizingMaskIntoConstraints = false
        secondFormField.placeholder = "მაგ: kusuna@mail.ru"
        secondFormField.borderStyle = .roundedRect
        secondFormField.font = UIFont(name: "Arial", size: 12)
        secondFormField.heightAnchor.constraint(equalToConstant: 20).isActive = true
        return secondFormField
    } ()
    
    let thirdForm: UIStackView = {
        let thirdForm = UIStackView()
        thirdForm.translatesAutoresizingMaskIntoConstraints = false
        thirdForm.heightAnchor.constraint(equalToConstant: 68).isActive = true
        return thirdForm
    } ()
    
    let thirdFormText: UILabel = {
        let thirdFormText = UILabel()
        thirdFormText.translatesAutoresizingMaskIntoConstraints = false
        thirdFormText.text = "პაროლი"
        thirdFormText.font = UIFont(name: "Arial", size: 12)
        thirdFormText.heightAnchor.constraint(equalToConstant: 20).isActive = true
        return thirdFormText
    } ()
    
    let thirdFormField: UITextField = {
        let thirdFormField = UITextField()
        thirdFormField.translatesAutoresizingMaskIntoConstraints = false
        thirdFormField.placeholder = "მაგ: busuna123, jajanaIsMyKumiri2010"
        thirdFormField.font = UIFont(name: "Arial", size: 12)
        thirdFormField.borderStyle = .roundedRect
        thirdFormField.heightAnchor.constraint(equalToConstant: 20).isActive = true
        thirdFormField.isSecureTextEntry = true
        return thirdFormField
    } ()
    
    let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.heightAnchor.constraint(equalToConstant: 46).isActive = true
        button.setTitle("შესვლა", for: .normal)
        button.layer.cornerRadius = 14
        return button
    } ()
    
    let orDevider: UIStackView = {
        let orDevider = UIStackView()
        orDevider.translatesAutoresizingMaskIntoConstraints = false
        orDevider.heightAnchor.constraint(equalToConstant: 22).isActive = true
        return orDevider
    } ()
    
    let orDeviderView1: UIView = {
        let orDeviderView = UIView()
        orDeviderView.translatesAutoresizingMaskIntoConstraints = false
        orDeviderView.backgroundColor = .gray
        orDeviderView.heightAnchor.constraint(equalToConstant: 2.5).isActive = true
        return orDeviderView
    } ()
    
    let orDeviderText: UILabel = {
        let orDeviderText = UILabel()
        orDeviderText.translatesAutoresizingMaskIntoConstraints = false
        orDeviderText.text = "ან"
        orDeviderText.font = UIFont(name: "Arial", size: 14)
        orDeviderText.textAlignment = .center
        return orDeviderText
    } ()
    
    let orDeviderView2: UIView = {
        let orDeviderView = UIView()
        orDeviderView.translatesAutoresizingMaskIntoConstraints = false
        orDeviderView.backgroundColor = .gray
        orDeviderView.heightAnchor.constraint(equalToConstant: 2.5).isActive = true
        return orDeviderView
    } ()
    
    let socialMedia: UIStackView = {
        let socialMedia = UIStackView()
        socialMedia.translatesAutoresizingMaskIntoConstraints = false
        return socialMedia
    } ()
    
    let google: UIStackView = {
        let google = UIStackView()
        google.translatesAutoresizingMaskIntoConstraints = false
        google.backgroundColor = .gray
        google.heightAnchor.constraint(equalToConstant: 48).isActive = true
        google.layer.cornerRadius = 14
        return google
    } ()
    
    let googleSubView: UIStackView = {
        let googleSubView = UIStackView()
        googleSubView.translatesAutoresizingMaskIntoConstraints = false
        googleSubView.widthAnchor.constraint(equalToConstant: 166).isActive = true
        googleSubView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        return googleSubView
    } ()
    
    let googleSubViewIcon: UIButton = {
        let googleSubViewIcon = UIButton()
        googleSubViewIcon.translatesAutoresizingMaskIntoConstraints = false
        googleSubViewIcon.widthAnchor.constraint(equalToConstant: 24).isActive = true
        let image = UIImage(named: "google")
        googleSubViewIcon.setImage(image, for: .normal)
        return googleSubViewIcon
    } ()
    
    let googleSubViewLabel: UILabel = {
        let googleSubViewLabel = UILabel()
        googleSubViewLabel.translatesAutoresizingMaskIntoConstraints = false
        googleSubViewLabel.text = "გამოიყენეთ გუგული"
        googleSubViewLabel.font = UIFont(name: "Arial", size: 14)
        return googleSubViewLabel
    } ()
    
    let facebook: UIStackView = {
        let facebook = UIStackView()
        facebook.translatesAutoresizingMaskIntoConstraints = false
        facebook.backgroundColor = .gray
        facebook.heightAnchor.constraint(equalToConstant: 48).isActive = true
        facebook.layer.cornerRadius = 14
        return facebook
    } ()
    
    let facebookSubView: UIStackView = {
        let facebookSubView = UIStackView()
        facebookSubView.translatesAutoresizingMaskIntoConstraints = false
        facebookSubView.widthAnchor.constraint(equalToConstant: 166).isActive = true
        facebookSubView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        return facebookSubView
    } ()
    
    let facebookSubViewIcon: UIButton = {
        let facebookSubViewIcon = UIButton()
        facebookSubViewIcon.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "facebook")
        facebookSubViewIcon.setImage(image, for: .normal)
        facebookSubViewIcon.widthAnchor.constraint(equalToConstant: 24).isActive = true
        return facebookSubViewIcon
    } ()
    
    let facebookSubViewLabel: UILabel = {
        let facebookSubViewLabel = UILabel()
        facebookSubViewLabel.translatesAutoresizingMaskIntoConstraints = false
        facebookSubViewLabel.text = "გამოიყენეთ fეისიიი"
        facebookSubViewLabel.font = UIFont(name: "Arial", size: 14)
        return facebookSubViewLabel
    } ()

// MARK: - DidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        addMainStackView()
        configureMainStackView()
        configureTopStackView()
        configureMiddleStackView()
        configureBottomStackView()
        configureTabMenu()
        configureSignInForm()
        configureInputForm()
        configureForms()
        configureOrDivider()
        configureSocialMedia()
        configureGoogleAndFacebook()
    }
    
// MARK: - Methods
    func addMainStackView() {
        self.view.addSubview(mainStackView)
        mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
    }
    
    func configureMainStackView() {
        mainStackView.axis = .vertical
        mainStackView.alignment = .fill
        mainStackView.distribution = .fill
        mainStackView.spacing = 30
        mainStackView.addArrangedSubview(topStackView)
        mainStackView.addArrangedSubview(middleStackView)
        mainStackView.addArrangedSubview(bottomStackView)
    }

    func configureTopStackView() {
        topStackView.alignment = .center
        topStackView.distribution = .fill
        topStackView.addArrangedSubview(lockImage)
        lockImage.translatesAutoresizingMaskIntoConstraints = false
        lockImage.contentMode = .scaleAspectFit
        lockImage.widthAnchor.constraint(equalToConstant: 90).isActive = true
        lockImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func configureMiddleStackView() {
        middleStackView.axis = .vertical
        middleStackView.alignment = .leading
        middleStackView.distribution = .fillProportionally
        middleStackView.spacing = 4
        middleStackView.addArrangedSubview(middleViewHeading)
        middleStackView.addArrangedSubview(middleViewParagraph)
    }
    
    func configureBottomStackView() {
        bottomStackView.axis = .vertical
        bottomStackView.distribution = .fillProportionally
        bottomStackView.spacing = 24
        bottomStackView.addArrangedSubview(tabMenu)
        bottomStackView.addArrangedSubview(signInForm)
        bottomStackView.addArrangedSubview(orDevider)
        bottomStackView.addArrangedSubview(socialMedia)
    }
    
    func configureTabMenu() {
        tabMenu.axis = .vertical
        tabMenu.spacing = 16
        tabMenu.addArrangedSubview(tabMenuLabel)
        tabMenu.addArrangedSubview(tabMenuView)

    }
    
    func configureSignInForm() {
        signInForm.axis = .vertical
        signInForm.spacing = 18
        signInForm.addArrangedSubview(inputForm)
        signInForm.addArrangedSubview(button)
        button.addTarget(self, action: #selector(buttonActions), for: .touchUpInside)
    }
    
    @objc func buttonActions() {
        if thirdFormField.accessibilityElementCount() < 6 || thirdFormField.accessibilityElementCount() > 15 {
            thirdFormField.backgroundColor = .red
        } else {
            thirdFormField.backgroundColor = .white
        }
    }
    
    func configureInputForm() {
        inputForm.axis = .vertical
        inputForm.spacing = 8
        inputForm.addArrangedSubview(firstForm)
        inputForm.addArrangedSubview(secondForm)
        inputForm.addArrangedSubview(thirdForm)
    }
    
    func configureForms() {
        firstForm.axis = .vertical
        secondForm.axis = .vertical
        thirdForm.axis = .vertical
        firstForm.spacing = 4
        secondForm.spacing = 4
        thirdForm.spacing = 4
        firstForm.addArrangedSubview(firstFormText)
        firstForm.addArrangedSubview(firstFormField)
        secondForm.addArrangedSubview(secondFormText)
        secondForm.addArrangedSubview(secondFormField)
        thirdForm.addArrangedSubview(thirdFormText)
        thirdForm.addArrangedSubview(thirdFormField)
    }
    
    func configureOrDivider() {
        orDevider.axis = .horizontal
        orDevider.alignment = .center
        orDevider.distribution = .fillEqually
        orDevider.spacing = 11
        orDevider.addArrangedSubview(orDeviderView1)
        orDevider.addArrangedSubview(orDeviderText)
        orDevider.addArrangedSubview(orDeviderView2)
    }
    
    func configureSocialMedia() {
        socialMedia.axis = .vertical
        socialMedia.distribution = .fillProportionally
        socialMedia.spacing = 16
        socialMedia.addArrangedSubview(google)
        socialMedia.addArrangedSubview(facebook)
        google.axis = .vertical
        google.alignment = .center
        google.distribution = .equalCentering
        google.addArrangedSubview(googleSubView)
        facebook.axis = .vertical
        facebook.alignment = .center
        facebook.distribution = .equalCentering
        facebook.addArrangedSubview(facebookSubView)
    }
    
    func configureGoogleAndFacebook() {
        googleSubView.axis = .horizontal
        googleSubView.spacing = 3
        googleSubView.distribution = .equalCentering
        googleSubView.addArrangedSubview(googleSubViewIcon)
        googleSubView.addArrangedSubview(googleSubViewLabel)
        facebookSubView.axis = .horizontal
        facebookSubView.spacing = 3
        facebookSubView.distribution = .equalCentering
        facebookSubView.addArrangedSubview(facebookSubViewIcon)
        facebookSubView.addArrangedSubview(facebookSubViewLabel)
    }
}

#Preview {
    ViewController()
}
