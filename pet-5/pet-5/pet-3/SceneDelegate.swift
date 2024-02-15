//
//  SceneDelegate.swift
//  pet-3
//
//  Created by Sailau Almaz Maratuly on 08.02.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let viewController = ViewController2()
        let nagivationController = UINavigationController(rootViewController: viewController)
        window = UIWindow(windowScene: scene)
        window?.rootViewController = nagivationController
        window?.makeKeyAndVisible()
    }
}

