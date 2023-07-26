//
//  MainTabBarController.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 26.07.2023.
//

import UIKit

class MainTabBarController: UITabBarController {

    private let viewModel = MainTabBarViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarController()
    }
    
    private func setupTabBarController() {
        
        let currencyListVC = createViewController(viewController: CurrencyListTableViewController(), tag: 0)
        let walletVC = createViewController(viewController: WalletTableViewController(), tag: 1)

        self.setViewControllers([currencyListVC, walletVC], animated: true)
    }
    
    private func createViewController(viewController: UIViewController, tag: Int) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: viewController)
        
        navigationVC.tabBarItem.image = UIImage(named: viewModel.tabBarItems[tag].imageName)
        navigationVC.viewControllers.first?.navigationItem.title = viewModel.tabBarItems[tag].title
        return navigationVC
    }
   
}
