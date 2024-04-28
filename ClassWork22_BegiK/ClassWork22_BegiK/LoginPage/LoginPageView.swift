//
//  LoginPageView.swift
//  ClassWork22_BegiK
//
//  Created by M1 on 26.04.2024.
//

import UIKit

//MARK: Extensions:
extension UILabel {
    func createLabel(text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.textColor = UIColor(named: "labelForColor")
        label.font = UIFont(name: "SF Pro", size: 11)
        return label
    }
}

extension UITextField {
    func createTextField (text: String) -> UITextField {
        let topInput = UITextField()
        topInput.translatesAutoresizingMaskIntoConstraints = false
        topInput.placeholder = text
        topInput.font = UIFont(name: "SF Pro", size: 11)
        topInput.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1)
        topInput.heightAnchor.constraint(equalToConstant: 45).isActive = true
        topInput.layer.borderWidth = 1
        topInput.layer.borderColor = UIColor(red: 141/255, green: 141/255, blue: 141/255, alpha: 1).cgColor
        topInput.layer.cornerRadius = 12
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(red: 99/255, green: 99/255, blue: 99/255, alpha: 1),
        ]
        topInput.attributedPlaceholder = NSAttributedString(string: text, attributes: attributes)
        topInput.textColor = .black
        topInput.widthAnchor.constraint(equalToConstant: 327).isActive = true
        return topInput
    }
}

class LoginPageView: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, LoginPageViewModelDelegate {

    //MARK: Properties:
    let viewModel = LoginPageViewModel()
    
    weak var delegate: LoginPageViewModelDelegate?
    
    let loginImage: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 132).isActive = true
        button.widthAnchor.constraint(equalToConstant: 132).isActive = true
        button.setBackgroundImage(UIImage(named: "loginImage"), for: .normal)
        return button
    }()
    
    let userNameLabel = UILabel().createLabel(text: "მომხმარებლის სახელი")
    
    let userNameField = UITextField().createTextField(text: "   შეიყვანეთ მომხმარებლის სახელი")
    
    let userPasswordLabel = UILabel().createLabel(text: "პაროლი")
    
    let userPasswordField = UITextField().createTextField(text: "   შეიყვანეთ პაროლი")
    
    let rePasswordLabel = UILabel().createLabel(text: "გაიმეორეთ პაროლი")
    
    let rePasswordField = UITextField().createTextField(text: "   განმეორებით შეიყვანეთ პაროლი")
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.layer.cornerRadius = 12
        button.widthAnchor.constraint(equalToConstant: 327).isActive = true
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        button.setTitle("შესვლა", for: .normal)
        return button
    }()
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        setupUI()
        loginButtonAction()
        autoLoginAction()
        loginImageAction()
    }
    
    //MARK: Functions
    func setupUI() {
        view.backgroundColor = UIColor(named: "backgroundColor")
        view.addSubview(loginImage)
        view.addSubview(userNameLabel)
        view.addSubview(userNameField)
        view.addSubview(userPasswordLabel)
        view.addSubview(userPasswordField)
        view.addSubview(rePasswordLabel)
        view.addSubview(rePasswordField)
        view.addSubview(loginButton)
        NSLayoutConstraint.activate([
            loginImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 110),
            loginImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userNameLabel.topAnchor.constraint(equalTo: loginImage.bottomAnchor, constant: 47),
            userNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            userNameField.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 6),
            userNameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            userPasswordLabel.topAnchor.constraint(equalTo: userNameField.bottomAnchor, constant: 31),
            userPasswordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            userPasswordField.topAnchor.constraint(equalTo: userPasswordLabel.bottomAnchor, constant: 6),
            userPasswordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            rePasswordLabel.topAnchor.constraint(equalTo: userPasswordField.bottomAnchor, constant: 31),
            rePasswordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            rePasswordField.topAnchor.constraint(equalTo: rePasswordLabel.bottomAnchor, constant: 6),
            rePasswordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            loginButton.topAnchor.constraint(equalTo: rePasswordField.bottomAnchor, constant: 50),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24)
        ])
    }
    
    func loginButtonAction() {
        loginButton.addAction(UIAction(handler: { [weak self] _ in
            self?.loginButtonTappedAction()
        }), for: .touchUpInside)
    }
    
    func loginButtonTapped(username: String, password: String) {
            delegate?.saveCredentials(username: username, password: password)
        }
    
    func saveCredentials(username: String, password: String) {
        delegate?.saveCredentials(username: username, password: password)
    }
        
    func loginButtonTappedAction() {
        guard let username = userNameField.text, let password = userPasswordField.text else {
            return
        }
        delegate?.loginButtonTapped(username: username, password: password)
        UserDefaults.standard.set(true, forKey: "hasLoggedIn")
        if !UserDefaults.standard.bool(forKey: "firstTimeLogin") {
            UserDefaults.standard.set(true, forKey: "firstTimeLogin")
        }
        let mainPageViewController = MainPageView()
        navigationController?.pushViewController(mainPageViewController, animated: true)
        
    }
    
    func autoLoginAction() {
        viewModel.autoLogin()
    }
    
    func didLogged() {
        let mainPageViewController = MainPageView()
        navigationController?.pushViewController(mainPageViewController, animated: true)
    }
    
    func loginImageTapped() {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            present(imagePicker, animated: true, completion: nil)
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            picker.dismiss(animated: true, completion: nil)
            
            if let pickedImage = info[.originalImage] as? UIImage {
                loginImage.setImage(pickedImage, for: .normal)
                if let imageData = pickedImage.jpegData(compressionQuality: 1.0) {
                    let fileManager = FileManager.default
                    let documentsPath = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
                    let imagePath = documentsPath.appendingPathComponent("profileImage.jpg")
                    
                    do {
                        try imageData.write(to: imagePath)
                        print("Image saved successfully at: \(imagePath)")
                    } catch {
                        print("Error saving image: \(error)")
                    }
                }
            }
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
        }
        
    func loginImageAction() {
        loginImage.addAction(UIAction(handler: { _ in
            self.loginImageTapped()
        }), for: .touchUpInside)
    }

}
