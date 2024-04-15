//
//  AddNewCardVC.swift
//  ClassWork17_BegiK
//
//  Created by M1 on 14.04.2024.
//

import UIKit

class AddNewCardVC: UIViewController {
    
//MAKR: Properties:
    let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "backgroundForLaunchScreen")
        image.contentMode = .scaleToFill
        return image
    }()
    
    let headerInputStackView: UIStackView = {
        let headerInputStackView = UIStackView()
        headerInputStackView.translatesAutoresizingMaskIntoConstraints = false
        return headerInputStackView
    }()
    
    let topStackView: UIStackView = {
        let headerInputStackView = UIStackView()
        headerInputStackView.translatesAutoresizingMaskIntoConstraints = false
        return headerInputStackView
    }()
    
    let topHeader: UILabel = {
        let header = UILabel()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.text = "  სათაური"
        header.textColor = .white
        header.font = UIFont(name: "FiraGO-BookItalic", size: 14)
        return header
    }()
    
    let topInput: UITextField = {
        let topInput = UITextField()
        topInput.translatesAutoresizingMaskIntoConstraints = false
        topInput.placeholder = "მაგ: პანიკა, დახმარება მჭირდება"
        topInput.font = UIFont(name: "FiraGO-BookItalic", size: 12)
        topInput.backgroundColor = UIColor(red: 31/255, green: 34/255, blue: 45/255, alpha: 1)
        topInput.borderStyle = .roundedRect
        topInput.layer.borderWidth = 1
        topInput.layer.borderColor = UIColor(red: 141/255, green: 141/255, blue: 141/255, alpha: 1).cgColor
        topInput.layer.cornerRadius = 5
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(red: 99/255, green: 99/255, blue: 99/255, alpha: 1),
            .font: UIFont(name: "FiraGO-BookItalic", size: 12)!
        ]
        topInput.attributedPlaceholder = NSAttributedString(string: "მაგ: პანიკა, დახმარება მჭირდება", attributes: attributes)
        topInput.textColor = .white
        topInput.widthAnchor.constraint(equalToConstant: 310).isActive = true
        return topInput
    }()
    
    let descriptionStackView: UIStackView = {
        let descriptionStackView = UIStackView()
        descriptionStackView.translatesAutoresizingMaskIntoConstraints = false
        return descriptionStackView
    }()
    
    let descHeader: UILabel = {
        let header = UILabel()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.text = "  აღწერა"
        header.textColor = .white
        header.font = UIFont(name: "FiraGO-BookItalic", size: 14)
        return header
    }()
    
    let descInput: UITextField = {
        let topInput = UITextField()
        topInput.translatesAutoresizingMaskIntoConstraints = false
        topInput.placeholder = "მაგ: ფიგმამ გამიჭედა და ვინმემ გამომიგზავნეთ"
        topInput.font = UIFont(name: "FiraGO-BookItalic", size: 12)
        topInput.backgroundColor = UIColor(red: 31/255, green: 34/255, blue: 45/255, alpha: 1)
        topInput.borderStyle = .roundedRect
        topInput.layer.borderWidth = 1
        topInput.layer.borderColor = UIColor(red: 141/255, green: 141/255, blue: 141/255, alpha: 1).cgColor
        topInput.layer.cornerRadius = 5
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(red: 99/255, green: 99/255, blue: 99/255, alpha: 1),
            .font: UIFont(name: "FiraGO-BookItalic", size: 12)!
        ]
        topInput.attributedPlaceholder = NSAttributedString(string: "მაგ: ფიგმამ გამიჭედა და ვინმემ გამომიგზავნეთ", attributes: attributes)
        topInput.textColor = .white
        topInput.widthAnchor.constraint(equalToConstant: 310).isActive = true
        return topInput
    }()
    
    let iconHeader: UILabel = {
        let iconHeader = UILabel()
        iconHeader.translatesAutoresizingMaskIntoConstraints = false
        iconHeader.text = "აირჩიეთ აიქონი"
        iconHeader.textColor = .white
        iconHeader.font = UIFont(name: "FiraGO-BookItalic", size: 14)
        return iconHeader
    }()
    
    let iconsStackView: UIStackView = {
        let iconsStackView = UIStackView()
        iconsStackView.translatesAutoresizingMaskIntoConstraints = false
        return iconsStackView
    }()
    
    let icon1: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "icon1"), for: .normal)
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        return button
    }()
    
    let icon2: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "icon2"), for: .normal)
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        return button
    }()
    
    let icon3: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "icon3"), for: .normal)
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        return button
    }()
    
    let icon4: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "icon4"), for: .normal)
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        return button
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0/255, green: 155/255, blue: 16/255, alpha: 1.0)
        button.setTitle("დამატება", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = UIFont(name: "FiraGO-BookItalic", size: 16)
        button.layer.cornerRadius = 15
        button.isEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 48).isActive = true
        button.widthAnchor.constraint(equalToConstant: 132).isActive = true
        return button
    }()
    
    var selectedIcon: String?

//MARK: DidLoad:
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        plusButtonAction()
    }

//MARK: SetupUI:
    func setupUI() {
        setupBackground()
        setupHeaderInput()
        setupDescriptionInput()
        setupIconHeader()
        setupIconsStack()
        setupButton()
    }
    
    func setupBackground() {
        view.addSubview(backgroundImage)
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setupHeaderInput() {
        view.addSubview(topStackView)
        topStackView.axis = .vertical
        topStackView.addArrangedSubview(topHeader)
        topStackView.addArrangedSubview(topInput)
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 91),
            topStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 33)
        ])
    }
    
    func setupDescriptionInput() {
        view.addSubview(descriptionStackView)
        descriptionStackView.axis = .vertical
        descriptionStackView.addArrangedSubview(descHeader)
        descriptionStackView.addArrangedSubview(descInput)
        NSLayoutConstraint.activate([
            descriptionStackView.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 10),
            descriptionStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 33)
        ])
    }
    
    func setupIconHeader() {
        view.addSubview(iconHeader)
        NSLayoutConstraint.activate([
            iconHeader.topAnchor.constraint(equalTo: descriptionStackView.bottomAnchor, constant: 29),
            iconHeader.leadingAnchor.constraint(equalTo: descriptionStackView.leadingAnchor, constant: 43)
        ])
    }
    
    func setupIconsStack() {
        view.addSubview(iconsStackView)
        iconsStackView.spacing = 27
        iconsStackView.addArrangedSubview(icon1)
        iconsStackView.addArrangedSubview(icon2)
        iconsStackView.addArrangedSubview(icon3)
        iconsStackView.addArrangedSubview(icon4)
        icon1.addAction(UIAction { [weak self] _ in
            self?.icon1Tapped()
        }, for: .touchUpInside)
        icon2.addAction(UIAction { [weak self] _ in
            self?.icon2Tapped()
        }, for: .touchUpInside)
        icon3.addAction(UIAction { [weak self] _ in
            self?.icon3Tapped()
        }, for: .touchUpInside)
        icon4.addAction(UIAction { [weak self] _ in
            self?.icon4Tapped()
        }, for: .touchUpInside)
        NSLayoutConstraint.activate([
            iconsStackView.topAnchor.constraint(equalTo: iconHeader.bottomAnchor, constant: 14),
            iconsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 62)
        ])
        
    }
    
    func setupButton() {
        view.addSubview(addButton)
        NSLayoutConstraint.activate([
            addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -98),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
//MARK: Button functional
    func iconTapped(_ sender: UIButton) {
        icon1.isSelected = false
        icon2.isSelected = false
        icon3.isSelected = false
        icon4.isSelected = false
        
        sender.isSelected = true
        
        switch sender {
        case icon1:
            selectedIcon = "icon1"
            icon1.backgroundColor = .orange
            icon1.layer.borderWidth = 1
            icon2.backgroundColor = .clear
            icon3.backgroundColor = .clear
            icon4.backgroundColor = .clear
        case icon2:
            selectedIcon = "icon2"
            icon1.backgroundColor = .clear
            icon2.backgroundColor = .orange
            icon2.layer.borderWidth = 1
            icon3.backgroundColor = .clear
            icon4.backgroundColor = .clear
        case icon3:
            selectedIcon = "icon3"
            icon1.backgroundColor = .clear
            icon2.backgroundColor = .clear
            icon3.backgroundColor = .orange
            icon3.layer.borderWidth = 1
            icon4.backgroundColor = .clear
        case icon4:
            selectedIcon = "icon4"
            icon1.backgroundColor = .clear
            icon2.backgroundColor = .clear
            icon3.backgroundColor = .clear
            icon4.backgroundColor = .orange
            icon4.layer.borderWidth = 1
        default:
            break
        }
    }
    
    func icon1Tapped() {
        iconTapped(icon1)
    }
    
    func icon2Tapped() {
        iconTapped(icon2)
    }
    
    func icon3Tapped() {
        iconTapped(icon3)
    }
    
    func icon4Tapped() {
        iconTapped(icon4)
    }
    
    func plusButtonAction() {
        let action = UIAction { [weak self] _ in
            self?.addButtonPageChangeAndAddCard()
        }
        addButton.addAction(action, for: .touchUpInside)
    }

    func addButtonPageChangeAndAddCard() {
        cards.append(Cards(header: topInput.text, description: descInput.text, icon: selectedIcon))
        let mainPageVC = navigationController?.viewControllers.first(where: { $0 is MainPageVC }) as? MainPageVC
        self.navigationController?.popToViewController(mainPageVC!, animated: false)
    }
    
}

#Preview {
    AddNewCardVC()
}
