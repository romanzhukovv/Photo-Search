//
//  PhotoCellViewModel.swift
//  Photo Search
//
//  Created by Roman Zhukov on 03.01.2023.
//

import Foundation

protocol PhotoCellViewModelProtocol {
    init(photo: Photo)
    func getPhotoURL() -> URL
}

final class PhotoCellViewModel: PhotoCellViewModelProtocol {
    
    private let photo: Photo
    
    init(photo: Photo) {
        self.photo = photo
    }
    
    func getPhotoURL() -> URL {
        
    }
}
