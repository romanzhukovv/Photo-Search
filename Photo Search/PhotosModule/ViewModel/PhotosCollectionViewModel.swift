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
    
    init(photos: [Photo])
    
    func cellViewModel(at indexPath: IndexPath) -> PhotoCellViewModelProtocol
    func getPhotos(completion: @escaping(() -> Void))
    func searchPhotos(query: String, completion: @escaping(() -> Void))
    func numberOfPhotos() -> Int
    func photoDetailViewModel(at indexPath: IndexPath) -> PhotoDetailViewModelProtocol
}

final class PhotosCollectionViewModel: PhotosCollectionViewModelProtocol {
    
    var router: PSRouterProtocol?
    
    var searchedPhotos: SearchedPhotos?
    
    private var photos: [Photo]
    
    init(photos: [Photo]) {
        self.photos = photos
    }
    
    func cellViewModel(at indexPath: IndexPath) -> PhotoCellViewModelProtocol {
        if searchedPhotos != nil {
            guard let searchedPhoto = searchedPhotos?.results[indexPath.row] else { return PhotoCellViewModel(photo: Photo()) }
            return PhotoCellViewModel(photo: searchedPhoto)
        } else {
            let photo = photos[indexPath.row]
            return PhotoCellViewModel(photo: photo)
        }
    }
    
    func getPhotos(completion: @escaping(() -> Void)) {
        NetworkManager.shared.fetchData { result in
            switch result {
            case .success(let data):
                self.photos = data
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func searchPhotos(query: String, completion: @escaping(() -> Void)) {
        NetworkManager.shared.searchPhotos(query: query) { result in
            switch result {
            case .success(let data):
                self.searchedPhotos = data
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func numberOfPhotos() -> Int {
        searchedPhotos != nil ?
        searchedPhotos?.results.count ?? 0 :
        photos.count
    }
    
    func photoDetailViewModel(at indexPath: IndexPath) -> PhotoDetailViewModelProtocol {
        let photo: Photo
        
        if searchedPhotos != nil {
            guard let searchedPhoto = searchedPhotos?.results[indexPath.row] else { return PhotoDetailViewModel(photo: Photo()) }
            photo = searchedPhoto
        } else {
            photo = photos[indexPath.row]
        }
        
        return PhotoDetailViewModel(photo: photo)
    }
}
