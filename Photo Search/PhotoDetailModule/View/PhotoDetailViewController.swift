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
        let alertController = UIAlertController(title:
                                                    isFavorite ?
                                                    Constants.Strings.Detail.deleteAlertTitle :
                                                    Constants.Strings.Detail.saveAlertTitle,
                                                message:
                                                    isFavorite ?
                                                    Constants.Strings.Detail.deleteAlertMessage :
                                                    Constants.Strings.Detail.saveAlertMessage ,
                                                preferredStyle: .alert)
        let submitAction = UIAlertAction(title: Constants.Strings.Detail.alertSubmitTitle,
                                         style: .default) { _ in
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
