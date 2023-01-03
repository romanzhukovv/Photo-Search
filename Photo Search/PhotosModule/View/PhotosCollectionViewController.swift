//
//  PhotosCollectionViewController.swift
//  Photo Search
//
//  Created by Roman Zhukov on 02.01.2023.
//

import UIKit

final class PhotosCollectionViewController: UICollectionViewController {
    
    var viewModel: PhotosCollectionViewModelProtocol!
    
    private let searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = Constants.Strings.Photos.searchBarPlaceholder
        return searchController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        viewModel.getPhotos {
            self.collectionView.reloadData()
        }
    }
}

extension PhotosCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfPhotos()
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoViewCell.reuseId,
                                                            for: indexPath) as? PhotoViewCell else { return UICollectionViewCell() }
        cell.viewModel = viewModel.cellViewModel(at: indexPath)
        cell.configureCell()
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewModel = viewModel.photoDetailViewModel(at: indexPath)
        self.viewModel.router?.pushPhotoDetailView(viewModel: viewModel, navigationController: navigationController)
    }
    
    private func setupCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.register(PhotoViewCell.self, forCellWithReuseIdentifier: PhotoViewCell.reuseId)
        
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
    }
}

extension PhotosCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (view.frame.width - 1) / 2, height: (view.frame.width - 1) / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        1
    }
}

extension PhotosCollectionViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel.searchPhotos(query: searchController.searchBar.text ?? "") {
            self.collectionView.reloadData()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.searchedPhotos = nil
        collectionView.reloadData()
    }
}


