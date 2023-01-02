//
//  TabBarViewController.swift
//  Photo Search
//
//  Created by Roman Zhukov on 02.01.2023.
//

import UIKit

final class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
           setupVCs()
    }
}

extension TabBarViewController {
    private func setupVCs() {
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        
        viewControllers = [
            createNavController(for: PhotosCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout()),
                                   title: "Photos",
                                   image: UIImage(systemName: "photo.on.rectangle.angled") ?? UIImage()),
            createNavController(for: FavoriteListViewController(),
                                title: "Favorite",
                                image: UIImage(systemName: "heart.fill") ?? UIImage())
        ]
    }
    
    private func createNavController(for rootViewController: UIViewController,
                                                    title: String,
                                                    image: UIImage) -> UIViewController {
          let navController = UINavigationController(rootViewController: rootViewController)
          navController.tabBarItem.title = title
          navController.tabBarItem.image = image
          navController.navigationBar.prefersLargeTitles = true
          rootViewController.navigationItem.title = title
          return navController
      }
}

