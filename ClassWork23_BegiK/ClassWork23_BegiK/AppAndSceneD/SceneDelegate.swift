//
//  SceneDelegate.swift
//  ClassWork23_BegiK
//
//  Created by M1 on 01.05.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        let viewModel = MainPageViewModel()
        let navigationController = UINavigationController(rootViewController: MainPageView(viewModel: viewModel))
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
}
