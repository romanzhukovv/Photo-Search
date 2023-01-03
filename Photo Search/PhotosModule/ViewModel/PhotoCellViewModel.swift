//
//  PhotoCellViewModel.swift
//  Photo Search
//
//  Created by Roman Zhukov on 03.01.2023.
//

import Foundation

protocol PhotoCellViewModelProtocol: AnyObject {
    init(photo: Photo)
    
    func getPhotoURL() -> URL
}

final class PhotoCellViewModel: PhotoCellViewModelProtocol {
    
    private let photo: Photo
    
    init(photo: Photo) {
        self.photo = photo
    }
    
    func getPhotoURL() -> URL {
        guard let url = URL(string: photo.urls?.small ?? "") else {
            fatalError("Could not create URL from the given string.")
        }
        return url
    }
}
