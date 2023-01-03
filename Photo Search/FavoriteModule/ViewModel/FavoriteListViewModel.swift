//
//  FavoriteListViewModel.swift
//  Photo Search
//
//  Created by Roman Zhukov on 03.01.2023.
//

import Foundation

protocol FavoriteListViewModelProtocol: AnyObject {
    var router: PSRouterProtocol? { get set }
    
    func cellViewModel(at indexPath: IndexPath) -> FavoritePhotoCellViewModelProtocol
    func didSelectRow(at indexPath: IndexPath)
    func numberOfRows() -> Int
}

final class FavoriteListViewModel: FavoriteListViewModelProtocol {
    
    var router: PSRouterProtocol?
    
    func cellViewModel(at indexPath: IndexPath) -> FavoritePhotoCellViewModelProtocol {
        let favoritePhoto = StorageManager.shared.favoritePhotos[indexPath.row]
        return FavoritePhotoCellViewModel(favoritePhoto: favoritePhoto)
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        let photo = StorageManager.shared.favoritePhotos[indexPath.row]
        let viewModel = PhotoDetailViewModel(photo: photo)
        
        router?.pushPhotoDetailView(viewModel: viewModel)
    }
    
    func numberOfRows() -> Int {
        StorageManager.shared.favoritePhotos.count
    }
}
