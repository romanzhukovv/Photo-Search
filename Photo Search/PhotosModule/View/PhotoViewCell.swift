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
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }
}

extension PhotoViewCell {
    private func configureCell() {
        photoImageView.kf.setImage(with: viewModel.getPhotoURL())
        
        layoutViews()
    }
    
    private func layoutViews() {
        contentView.addSubview(photoImageView)
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            photoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            photoImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            photoImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            photoImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor)
        ])
    }
}
