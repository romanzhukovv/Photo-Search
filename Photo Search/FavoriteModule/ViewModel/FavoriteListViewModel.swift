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
    func photoDetailViewModel(at indexPath: IndexPath) -> PhotoDetailViewModelProtocol
    func numberOfRows() -> Int
}

final class FavoriteListViewModel: FavoriteListViewModelProtocol {
    
    var router: PSRouterProtocol?
    
    func cellViewModel(at indexPath: IndexPath) -> FavoritePhotoCellViewModelProtocol {
        let favoritePhoto = StorageManager.shared.favoritePhotos.reversed()[indexPath.row]
        return FavoritePhotoCellViewModel(favoritePhoto: favoritePhoto)
    }
    
    func photoDetailViewModel(at indexPath: IndexPath) -> PhotoDetailViewModelProtocol {
        let photo = StorageManager.shared.favoritePhotos.reversed()[indexPath.row]
        return PhotoDetailViewModel(photo: photo)
    }
    
    func numberOfRows() -> Int {
        StorageManager.shared.favoritePhotos.count
    }
}
