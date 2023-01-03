//
//  PhotoViewCell.swift
//  Photo Search
//
//  Created by Roman Zhukov on 02.01.2023.
//

import UIKit
import Kingfisher

final class PhotoViewCell: UICollectionViewCell {
    
    var viewModel: PhotoCellViewModelProtocol!
    
    static let reuseId = "PhotoCell"
    
    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }
}

extension PhotoViewCell {
    func configureCell() {
        photoImageView.kf.setImage(with: viewModel.getPhotoURL())
        
        layoutViews()
    }
    
    private func layoutViews() {
        contentView.setupViews(photoImageView)
        
        NSLayoutConstraint.activate([
            photoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            photoImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            photoImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            photoImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor)
        ])
    }
}
