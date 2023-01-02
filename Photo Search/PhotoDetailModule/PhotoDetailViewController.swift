//
//  PhotoDetailViewController.swift
//  Photo Search
//
//  Created by Roman Zhukov on 02.01.2023.
//

import UIKit

class PhotoDetailViewController: PSBaseViewController<PhotoDetailView> {
    
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
        showAlert(isFavorite: StorageManager.shared.checkFavorite(photo: photo))
    }
    
    private func showAlert(favoriteStatus: Bool) {
        let alertController = UIAlertController(title: isFavorite ? "Deleting" : "Saving",
                                                message: isFavorite ? "Photo was deleted from favorite list" : "Photo was saved to favorite list" ,
                                                preferredStyle: .alert)
        let submitAction = UIAlertAction(title: "Ok", style: .default) { _ in
            if isFavorite {
                StorageManager.shared.deletePhoto(photo: self.photo)
                self.navigationController?.popViewController(animated: true)
            } else {
                StorageManager.shared.savePhoto(photo: self.photo)
                
                self.favoriteButton.setTitle(StorageManager.shared.checkFavorite(photo: self.photo) ? "Delete from favorite" : "Save to favorite", for: .normal)
                self.favoriteButton.backgroundColor = StorageManager.shared.checkFavorite(photo: self.photo) ? .systemRed : .systemBlue
            }
        }
        alertController.addAction(submitAction)
        
        present(alertController, animated: true, completion: nil)
    }
}
