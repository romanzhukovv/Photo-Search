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
                self.navigationController?.popViewController(animated: true)
            } else {
                self.viewModel.savePhoto()
                
                self.rootView.favoriteButton.setTitle(isFavorite ? "Delete from favorite" : "Save to favorite", for: .normal)
                self.rootView.favoriteButton.backgroundColor = isFavorite ? .systemRed : .systemBlue
            }
        }
        
        alertController.addAction(submitAction)
        present(alertController, animated: true, completion: nil)
    }
}
