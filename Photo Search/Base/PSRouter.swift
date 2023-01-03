//
//  PSRouter.swift
//  Photo Search
//
//  Created by Roman Zhukov on 02.01.2023.
//

import UIKit

protocol PSRouterProtocol {
    var configurator: PSConfiguratorProtocol? { get set }
    
    func initTabBarViewController(navigationController: UINavigationController?,
                                  initialViewController: UIViewController,
                                  title: String,
                                  image: UIImage)
    func pushPhotoDetailView(viewModel: PhotoDetailViewModelProtocol, navigationController: UINavigationController?)
    func popPhotoDetailView(navigationController: UINavigationController?)
}

class PSRouter: PSRouterProtocol {
    
    var configurator: PSConfiguratorProtocol?

    init(configurator: PSConfiguratorProtocol) {
        self.configurator = configurator
    }
    
    func initTabBarViewController(navigationController: UINavigationController?,
                                  initialViewController: UIViewController,
                                  title: String,
                                  image: UIImage) {
        if let navigationController = navigationController {
            navigationController.viewControllers = [initialViewController]
            navigationController.tabBarItem.title = title
            navigationController.tabBarItem.image = image
            navigationController.navigationBar.prefersLargeTitles = true
            initialViewController.navigationItem.title = title
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
