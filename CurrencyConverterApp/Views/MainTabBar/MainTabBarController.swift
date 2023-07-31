//
//  MainTabBarController.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 26.07.2023.
//

import UIKit
import SwiftUI

class MainTabBarController: UITabBarController {

    private var viewModel: MainTabBarViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = MainTabBarViewModel()
        setupTabBarController()
    }
    
    private func setupTabBarController() {
        guard let viewModel = viewModel else { return }
        
        let currencyListVC = viewModel.createViewController(viewController: CurrencyListTableViewController(), tag: .currencyList)
        let walletVC = viewModel.createSwiftUIController(someView: WalletView(), tag: .wallet)
        let settingsVC = viewModel.createViewController(viewController: SettingsTableViewController(), tag: .settings)
        let bidsVC = viewModel.createSwiftUIController(someView: BidsSwiftUIView(), tag: .bids)

        self.setViewControllers([currencyListVC, walletVC, bidsVC, settingsVC], animated: true)
    }
    
    
   
}
