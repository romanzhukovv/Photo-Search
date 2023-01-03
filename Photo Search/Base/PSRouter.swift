//
//  PSRouter.swift
//  Photo Search
//
//  Created by Roman Zhukov on 02.01.2023.
//

import UIKit

protocol PSRouterProtocol {
    var navigationController: UINavigationController? { get set }
    var configurator: PSConfiguratorProtocol? { get set }
//    
    func initPhotoCollectionView()
    func initFavoriteListView()
    func pushPhotoDetailView(viewModel: PhotoDetailViewModelProtocol)
    func popPhotoDetailView()
}

class PSRouter: PSRouterProtocol {
    
    var navigationController: UINavigationController?
    var configurator: PSConfiguratorProtocol?

    init(navigationController: UINavigationController, configurator: PSConfiguratorProtocol) {
        self.navigationController = navigationController
        self.configurator = configurator
    }

    func initPhotoCollectionView() {
        if let navigationController = navigationController {
            guard let initialViewController = configurator?.createPhotosModule(router: self) else { return }
            navigationController.viewControllers = [initialViewController]
        }
    }
    
    func initFavoriteListView() {
        if let navigationController = navigationController {
            guard let initialViewController = configurator?.createFavoriteModule(router: self) else { return }
            navigationController.viewControllers = [initialViewController]
        }
    }
    
    func pushPhotoDetailView(viewModel: PhotoDetailViewModelProtocol) {
        if let navigationController = navigationController {
            guard let photoDetailView = configurator?.createPhotoDetailModule(router: self, viewModel: viewModel) else { return }
            photoDetailView.hidesBottomBarWhenPushed = true
            navigationController.pushViewController(photoDetailView, animated: true)
        }
    }
    
    func popPhotoDetailView() {
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        }
    }
}
