//
//  PhotoDetailView.swift
//  Photo Search
//
//  Created by Roman Zhukov on 03.01.2023.
//

import UIKit

final class PhotoDetailView: PSBaseView {
    
    var viewModel: PhotoDetailViewModelProtocol!
    
    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()
    
    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 15
        return stackView
    }()
    
    private let authorNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private let createdDateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private let downloadsCountLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    let favoriteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
}

extension PhotoDetailView {
    override func addViews() {
        super.addViews()
        
        setupViews(
            activityIndicator,
            photoImageView,
            verticalStackView,
            authorNameLabel,
            createdDateLabel,
            locationLabel,
            downloadsCountLabel,
            favoriteButton
        )
        
        [
            authorNameLabel,
            createdDateLabel,
            locationLabel,
            downloadsCountLabel
        ].forEach {
            verticalStackView.addArrangedSubview($0)
        }
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.topAnchor.constraint(equalTo: photoImageView.centerYAnchor),
            
            photoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -40),
            photoImageView.widthAnchor.constraint(equalTo: widthAnchor),
            photoImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.45),
            
            verticalStackView.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 15),
            verticalStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            verticalStackView.widthAnchor.constraint(equalTo: widthAnchor),
            
            favoriteButton.topAnchor.constraint(equalTo: downloadsCountLabel.bottomAnchor, constant: 15),
            favoriteButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            favoriteButton.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        
        activityIndicator.startAnimating()
        fetchFullSizePhoto(url: viewModel.getPhotoURL())
        
        authorNameLabel.text = viewModel.authorName
        createdDateLabel.text = viewModel.createdDate
        locationLabel.text = viewModel.location
        downloadsCountLabel.text = viewModel.downloadsCount
        
        favoriteButton.setTitle(StorageManager.shared.checkFavorite(photo: photo) ? "Delete from favorite" : "Save to favorite", for: .normal)
        
        favoriteButton.backgroundColor = StorageManager.shared.checkFavorite(photo: photo) ? .systemRed : .systemBlue
        
    }
}

private extension PhotoDetailView {
    func fetchFullSizePhoto(url: URL) {
        photoImageView.kf.setImage(with: url) { _ in
            self.activityIndicator.stopAnimating()
        }
    }
    
    
}
