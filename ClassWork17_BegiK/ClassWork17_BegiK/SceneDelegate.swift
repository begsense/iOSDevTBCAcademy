//
//  SceneDelegate.swift
//  ClassWork15_BegiK
//
//  Created by M1 on 10.04.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        let navigationController = UINavigationController(rootViewController: OnboardingVC())
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

}
