//
//  PSRouter.swift
//  Photo Search
//
//  Created by Roman Zhukov on 02.01.2023.
//

import UIKit

protocol PSRouterProtocol {
//    var navigationController: UINavigationController? { get set }
//    var configurator: FTConfiguratorProtocol? { get set }
//    
//    func initTransactionsListView()
//    func pushNewTransactionView(viewModel: NewTransactionViewModelProtocol)
//    func popNewTransactionView()
}

class PSRouter: PSRouterProtocol {
//    var navigationController: UINavigationController?
//    var configurator: FTConfiguratorProtocol?
//
//    init(navigationController: UINavigationController, configurator: FTConfiguratorProtocol) {
//        self.navigationController = navigationController
//        self.configurator = configurator
//    }
//
//    func initTransactionsListView() {
//        if let navigationController = navigationController {
//            guard let initialViewController = configurator?.createTransactionListModule(router: self) else { return }
//            initialViewController.title = "Transactions"
//            navigationController.viewControllers = [initialViewController]
//        }
//    }
//
//    func pushNewTransactionView(viewModel: NewTransactionViewModelProtocol) {
//        if let navigationController = navigationController {
//            guard let newTransactionView = configurator?.createNewTransactionModule(router: self, viewModel: viewModel) else { return }
//            newTransactionView.title = "New Transaction"
//            newTransactionView.navigationItem.largeTitleDisplayMode = .never
//            navigationController.pushViewController(newTransactionView, animated: true)
//        }
//    }
//
//    func popNewTransactionView() {
//        if let navigationController = navigationController {
//            navigationController.popViewController(animated: true)
//        }
//    }
}
