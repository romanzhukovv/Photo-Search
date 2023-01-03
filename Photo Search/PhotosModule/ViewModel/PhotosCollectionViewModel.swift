//
//  PhotosCollectionViewModel.swift
//  Photo Search
//
//  Created by Roman Zhukov on 03.01.2023.
//

import Foundation

protocol PhotosCollectionViewModelProtocol: AnyObject {
    var router: PSRouterProtocol? { get set }
    var searchedPhotos: SearchedPhotos? { get set }
    var isSearching: Bool? { get set }
    
    init(photos: [Photo])
    
    func cellViewModel(at indexPath: IndexPath) -> PhotoCellViewModelProtocol
    func getPhotos()
    func searchPhotos(query: String)
    func numberOfPhotos() -> Int
}

final class PhotosCollectionViewModel: PhotosCollectionViewModelProtocol {
    
    var router: PSRouterProtocol?
    
    var searchedPhotos: SearchedPhotos?
    
    var isSearching: Bool?
    
    private var photos: [Photo]
    
    init(photos: [Photo]) {
        self.photos = photos
    }
    
    func cellViewModel(at indexPath: IndexPath) -> PhotoCellViewModelProtocol {
        if isSearching ?? false {
            guard let searchedPhoto = searchedPhotos?.results[indexPath.row] else { return PhotoCellViewModel(photo: Photo()) }
            return PhotoCellViewModel(photo: searchedPhoto)
        } else {
            let photo = photos[indexPath.row]
            return PhotoCellViewModel(photo: photo)
        }
    }
    
    func getPhotos() {
        NetworkManager.shared.fetchData { result in
            switch result {
            case .success(let data):
                self.photos = data
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func searchPhotos(query: String) {
        NetworkManager.shared.searchPhotos(query: query) { result in
            switch result {
            case .success(let data):
                self.searchedPhotos = data
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func numberOfPhotos() -> Int {
        if isSearching ?? false {
            return searchedPhotos?.results.count ?? 0
        }
        return photos.count
    }
}
