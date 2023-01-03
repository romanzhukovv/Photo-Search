//
//  FavoriteCellViewModel.swift
//  Photo Search
//
//  Created by Roman Zhukov on 03.01.2023.
//

import Foundation

protocol FavoritePhotoCellViewModelProtocol {
    var authorName: String { get }
    init(favoritePhoto: Photo)
    func getPhotoURL() -> URL
}

final class FavoritePhotoCellViewModel: FavoritePhotoCellViewModelProtocol {
    
    var authorName: String {
        favoritePhoto.user?.name ?? "No author name"
    }
    
    private let favoritePhoto: Photo
    
    init(favoritePhoto: Photo) {
        self.favoritePhoto = favoritePhoto
    }
    
    func getPhotoURL() -> URL {
        guard let url = URL(string: favoritePhoto.urls?.small ?? "") else {
            fatalError("Could not create URL from the given string.")
        }
        return url
    }
}
