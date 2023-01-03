//
//  SceneDelegate.swift
//  Photo Search
//
//  Created by Roman Zhukov on 02.01.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        let tabBar = PSTabBarController()
        let configurator = PSConfigurator()
        let router = PSRouter(configurator: configurator)
        
        let photosNavController = UINavigationController()
        let favoriteNavController = UINavigationController()
        
        router.initTabBarViewController(navigationController: photosNavController,
                                        initialViewController: configurator.createPhotosModule(router: router),
                                        title: Constants.Strings.Photos.title,
                                        image: Constants.Images.Photos.tabBarImage)
        router.initTabBarViewController(navigationController: favoriteNavController,
                                        initialViewController: configurator.createFavoriteModule(router: router),
                                        title: Constants.Strings.Favorite.title,
                                        image: Constants.Images.Favorite.tabBarImage)
        
        tabBar.viewControllers = [photosNavController, favoriteNavController]
        
        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
    }
}

