//
//  PSConfigurator.swift
//  Photo Search
//
//  Created by Roman Zhukov on 02.01.2023.
//

import UIKit

protocol PSConfiguratorProtocol {
    func createPhotosModule(router: PSRouterProtocol) -> UIViewController
    func createFavoriteModule(router: PSRouterProtocol) -> UIViewController
    func createPhotoDetailModule(router: PSRouterProtocol, viewModel: PhotoDetailViewModelProtocol) -> UIViewController
}

final class PSConfigurator: PSConfiguratorProtocol {
    
    func createPhotosModule(router: PSRouterProtocol) -> UIViewController {
        let photos = [Photo]()
        let viewModel = PhotosCollectionViewModel(photos: photos)
        let view = PhotosCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        viewModel.router = router
        view.viewModel = viewModel
        return view
    }
    
    func createFavoriteModule(router: PSRouterProtocol) -> UIViewController {
        let view = FavoriteListViewController()
        let viewModel = FavoriteListViewModel()
        viewModel.router = router
        view.viewModel = viewModel
        return view
    }
    
    func createPhotoDetailModule(router: PSRouterProtocol, viewModel: PhotoDetailViewModelProtocol) -> UIViewController {
        let view = PhotoDetailViewController()
        viewModel.router = router
        view.viewModel = viewModel
        view.rootView.viewModel = viewModel
        return view
    }
}
