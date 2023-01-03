//
//  FavoritePhotoViewCell.swift
//  Photo Search
//
//  Created by Roman Zhukov on 02.01.2023.
//

import UIKit

final class FavoritePhotoViewCell: UITableViewCell {
    
    var viewModel: FavoritePhotoCellViewModelProtocol!
    
    static let reuseId = "FavoritePhotoCell"

    private let authorNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FavoritePhotoViewCell {
    func configureCell() {
        photoImageView.kf.setImage(with: viewModel.getPhotoURL())
        authorNameLabel.text = viewModel.authorName

        layoutViews()
    }

    private func layoutViews() {
        contentView.addSubview(photoImageView)
        contentView.addSubview(authorNameLabel)
        authorNameLabel.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            photoImageView.widthAnchor.constraint(equalToConstant: 100),
            photoImageView.heightAnchor.constraint(equalToConstant: 100),
            photoImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            authorNameLabel.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 20),
            authorNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            authorNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
