//
//  PhotosCollectionViewController.swift
//  Photo Search
//
//  Created by Roman Zhukov on 02.01.2023.
//

import UIKit

final class PhotosCollectionViewController: UICollectionViewController {
    
    var viewModel: PhotosCollectionViewModelProtocol!
    
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    
    private var isSearching: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        viewModel.getPhotos()
        collectionView.reloadData()
        setupSearchController()
    }

    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfPhotos()
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoViewCell.reuseId, for: indexPath) as? PhotoViewCell else { return UICollectionViewCell() }
        cell.viewModel = viewModel.cellViewModel(at: indexPath)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let photo: Photo
//
//        if self.isSearching {
//            guard let searchedPhoto = searchedPhotos?.results[indexPath.row] else { return }
//            photo = searchedPhoto
//        } else {
//            photo = photos[indexPath.row]
//        }
//        
//        let detailVC = PhotoDetailViewController(photo: photo)
//
//        detailVC.hidesBottomBarWhenPushed = true
//        navigationController?.pushViewController(detailVC, animated: true)
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
    private func setupSearchController() {
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search photo"
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel.searchPhotos(query: searchController.searchBar.text ?? "")
        collectionView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        if !searchBarIsEmpty && viewModel.searchedPhotos != nil {
            collectionView.reloadData()
            viewModel.searchedPhotos = nil
        } else if searchBarIsEmpty && viewModel.searchedPhotos != nil {
            collectionView.reloadData()
            viewModel.searchedPhotos = nil
        }
    }
}

extension PhotosCollectionViewController {
    private func setupCollectionView() {
        collectionView.backgroundColor = .white
        collectionView!.register(PhotoViewCell.self, forCellWithReuseIdentifier: PhotoViewCell.reuseId)
    }
}