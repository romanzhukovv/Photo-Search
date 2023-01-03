//
//  FavoriteListViewModel.swift
//  Photo Search
//
//  Created by Roman Zhukov on 03.01.2023.
//

import Foundation

protocol FavoriteListViewModelProtocol {
    func cellViewModel(at indexPath: IndexPath) -> FavoritePhotoCellViewModelProtocol
    func numberOfRows() -> Int
}

final class FavoriteListViewModel: FavoriteListViewModelProtocol {
    func cellViewModel(at indexPath: IndexPath) -> FavoritePhotoCellViewModelProtocol {
        let favoritePhoto = StorageManager.shared.favoritePhotos[indexPath.row]
        return FavoritePhotoCellViewModel(favoritePhoto: favoritePhoto)
    }
    
    func numberOfRows() -> Int {
        StorageManager.shared.favoritePhotos.count
    }
}
