//
//  MainTabBarController.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 26.07.2023.
//

import UIKit
import SwiftUI

class MainTabBarController: UITabBarController {

    private let viewModel = MainTabBarViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarController()
    }
    
    private func setupTabBarController() {
        
        let currencyListVC = createViewController(viewController: CurrencyListTableViewController(), tag: 0)
        let walletVC = createSwiftUIController(someView: WalletView(), tag: 1)
        let settingsVC = createViewController(viewController: SettingsTableViewController(), tag: 2)

        self.setViewControllers([currencyListVC, walletVC, settingsVC], animated: true)
    }
    
    private func createViewController(viewController: UIViewController, tag: Int) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: viewController)
        
        navigationVC.tabBarItem.image = UIImage(named: viewModel.tabBarItems[tag].imageName)
        navigationVC.viewControllers.first?.navigationItem.title = viewModel.tabBarItems[tag].title
        return navigationVC
    }
    
    private func createSwiftUIController(someView: some View, tag: Int) -> UIViewController {
        let hostingController = UIHostingController(rootView: someView)
        hostingController.tabBarItem.image = UIImage(named: viewModel.tabBarItems[tag].imageName)
        return hostingController
    }
   
}
