//
//  PhotoDetailViewController.swift
//  Photo Search
//
//  Created by Roman Zhukov on 02.01.2023.
//

import UIKit

final class PhotoDetailViewController: PSBaseViewController<PhotoDetailView> {
    
    var viewModel: PhotoDetailViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rootView.favoriteButton.addTarget(self,
                                          action: #selector(favoriteButtonAction),
                                          for: .touchUpInside)
    }
}

extension PhotoDetailViewController {
    @objc private func favoriteButtonAction() {
        showAlert(isFavorite: viewModel.isFavorite)
    }
    
    private func showAlert(isFavorite: Bool) {
        let alertController = UIAlertController(title: isFavorite ? "Deleting" : "Saving",
                                                message: isFavorite ? "Photo was deleted from favorite list" : "Photo was saved to favorite list" ,
                                                preferredStyle: .alert)
        let submitAction = UIAlertAction(title: "Ok", style: .default) { _ in
            if isFavorite {
                self.viewModel.deletePhoto()
                self.viewModel.router?.popPhotoDetailView(navigationController: self.navigationController)
            } else {
                self.viewModel.savePhoto()
                self.rootView.configureFavoriteButton(isFavorite: true)
            }
        }
        
        alertController.addAction(submitAction)
        present(alertController, animated: true, completion: nil)
    }
}
