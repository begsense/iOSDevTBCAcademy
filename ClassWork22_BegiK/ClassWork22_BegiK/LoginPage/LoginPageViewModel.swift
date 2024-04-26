//
//  LoginPageViewModel.swift
//  ClassWork22_BegiK
//
//  Created by M1 on 26.04.2024.
//

import UIKit

protocol LoginPageViewModelDelegate: AnyObject {
    func loginButtonTapped(with username: String, password: String)
    func didLogged()
}

class LoginPageViewModel {
    
    weak var delegate: LoginPageViewModelDelegate?
    
    func saveCredentials(username: String, password: String) {
        guard let usernameData = username.data(using: .utf8), let passwordData = password.data(using: .utf8) else {
            return
        }
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: usernameData,
            kSecValueData as String: passwordData
        ]
        
        SecItemDelete(query as CFDictionary)
        
        let status = SecItemAdd(query as CFDictionary, nil)
        guard status == errSecSuccess else {
            print("Error saving credentials to Keychain")
            return
        }
    }
    
    func loginButtonTapped(with username: String, password: String) {
        delegate?.loginButtonTapped(with: username, password: password)
        
    }
    
    func autoLogin() {
        if UserDefaults.standard.bool(forKey: "hasLoggedIn") {
            delegate?.didLogged()
        }
    }
}
