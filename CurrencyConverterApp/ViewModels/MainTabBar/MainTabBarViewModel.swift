//
//  MainTabBarViewModel.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 26.07.2023.
//

import UIKit
import SwiftUI

enum MainControllers: Int {
    case currencyList = 0
    case wallet = 1
    case bids = 2
    case settings = 3
}

class MainTabBarViewModel: MainTabBarViewModelProtocol {
    var tabBarItems: [MainTabBarItemModel] = [
        MainTabBarItemModel(title: "Currency List", imageName: "currency-dollar"),
        MainTabBarItemModel(title: "Wallet", imageName: "wallet"),
        MainTabBarItemModel(title: "Bids", imageName: "credit-card"),
        MainTabBarItemModel(title: "Settings", imageName: "settings")
    ]
    
    public func createViewController(viewController: UIViewController, tag: MainControllers) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: viewController)
        
        navigationVC.tabBarItem.image = UIImage(named: tabBarItems[tag.rawValue].imageName)
        navigationVC.viewControllers.first?.navigationItem.title = tabBarItems[tag.rawValue].title
        return navigationVC
    }
    
    public func createSwiftUIController(someView: some View, tag: MainControllers) -> UIViewController {
        let hostingController = UIHostingController(rootView: someView)
        hostingController.tabBarItem.image = UIImage(named: tabBarItems[tag.rawValue].imageName)
        return hostingController
    }
}
