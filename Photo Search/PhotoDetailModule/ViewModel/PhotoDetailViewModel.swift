//
//  PhotoDetailViewModel.swift
//  Photo Search
//
//  Created by Roman Zhukov on 03.01.2023.
//

import Foundation

protocol PhotoDetailViewModelProtocol {
    var authorName: String { get }
    var createdDate: String { get }
    var location: String { get }
    var downloadsCount: String { get }
    var isFavorite: Bool { get }
    
    init(photo: Photo)
    func getPhotoURL() -> URL
    func deletePhoto()
    func savePhoto()
}

final class PhotoDetailViewModel: PhotoDetailViewModelProtocol {
    
    var authorName: String {
        photo.user?.name ?? "No author name"
    }
    
    var createdDate: String {
        photo.created_at ?? "No date"
    }
    
    var location: String {
        photo.user?.location ?? "No location"
    }
    
    var downloadsCount: String {
        "\(photo.downloads ?? 0)"
    }
    
    var isFavorite: Bool {
        StorageManager.shared.checkFavorite(photo: photo)
    }
    
    private let photo: Photo
    
    init(photo: Photo) {
        self.photo = photo
    }
    
    func getPhotoURL() -> URL {
        guard let url = URL(string: photo.urls?.full ?? "") else {
            fatalError("Could not create URL from the given string.")
        }
        return url
    }
    
    func deletePhoto() {
        StorageManager.shared.deletePhoto(photo: photo)
    }
    
    func savePhoto() {
        StorageManager.shared.savePhoto(photo: photo)
    }
}
