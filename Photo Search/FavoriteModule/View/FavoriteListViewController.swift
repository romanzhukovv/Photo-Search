//
//  FavoriteListViewController.swift
//  Photo Search
//
//  Created by Roman Zhukov on 02.01.2023.
//

import UIKit

final class FavoriteListViewController: UITableViewController {

    var viewModel: FavoriteListViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FavoritePhotoViewCell.reuseId, for: indexPath) as? FavoritePhotoViewCell else { return UITableViewCell() }
        cell.viewModel = viewModel.cellViewModel(at: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let photo = favoritePhotos[indexPath.row]
//        let detailVC = PhotoDetailViewController(photo: photo)
//        detailVC.hidesBottomBarWhenPushed = true
//        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension FavoriteListViewController {
    private func setupTableView() {
        tableView.register(FavoritePhotoViewCell.self, forCellReuseIdentifier: FavoritePhotoViewCell.reuseId)
        tableView.backgroundColor = .white
        tableView.rowHeight = 140
    }
}
