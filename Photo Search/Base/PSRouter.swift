//
//  PSRouter.swift
//  Photo Search
//
//  Created by Roman Zhukov on 02.01.2023.
//

import UIKit

protocol PSRouterProtocol {
    var configurator: PSConfiguratorProtocol? { get set }
    
    func initPhotoCollectionView(navigationController: UINavigationController?)
    func initFavoriteListView(navigationController: UINavigationController?)
    func pushPhotoDetailView(viewModel: PhotoDetailViewModelProtocol, navigationController: UINavigationController?)
    func popPhotoDetailView(navigationController: UINavigationController?)
}

class PSRouter: PSRouterProtocol {
    
    var configurator: PSConfiguratorProtocol?

    init(configurator: PSConfiguratorProtocol) {
        self.configurator = configurator
    }

    func initPhotoCollectionView(navigationController: UINavigationController?) {
        if let navigationController = navigationController {
            guard let initialViewController = configurator?.createPhotosModule(router: self) else { return }
            navigationController.viewControllers = [initialViewController]
            navigationController.tabBarItem.title = "Photos"
            navigationController.tabBarItem.image = UIImage(systemName: "photo.on.rectangle.angled") ?? UIImage()
            navigationController.navigationBar.prefersLargeTitles = true
            initialViewController.navigationItem.title = "Photos"
        }
    }
    
    func initFavoriteListView(navigationController: UINavigationController?) {
        if let navigationController = navigationController {
            guard let initialViewController = configurator?.createFavoriteModule(router: self) else { return }
            navigationController.viewControllers = [initialViewController]
            navigationController.tabBarItem.title = "Favorite"
            navigationController.tabBarItem.image = UIImage(systemName: "heart.fill") ?? UIImage()
            navigationController.navigationBar.prefersLargeTitles = true
            initialViewController.navigationItem.title = "Favorite"
        }
    }
    
    func pushPhotoDetailView(viewModel: PhotoDetailViewModelProtocol, navigationController: UINavigationController?) {
        if let navigationController = navigationController {
            guard let photoDetailView = configurator?.createPhotoDetailModule(router: self, viewModel: viewModel) else { return }
            photoDetailView.hidesBottomBarWhenPushed = true
            navigationController.pushViewController(photoDetailView, animated: true)
        }
    }
    
    func popPhotoDetailView(navigationController: UINavigationController?) {
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        }
    }
}
