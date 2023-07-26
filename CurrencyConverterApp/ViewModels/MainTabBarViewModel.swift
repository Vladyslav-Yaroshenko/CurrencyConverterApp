//
//  MainTabBarViewModel.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 26.07.2023.
//

import UIKit

class MainTabBarViewModel: MainTabBarViewModelProtocol {
    var tabBarItems: [MainTabBarItemModel] = [
        MainTabBarItemModel(title: "Currency List", imageName: "currency-dollar"),
        MainTabBarItemModel(title: "Wallet", imageName: "wallet")
//        MainTabBarItemModel(title: "Bids", imageName: "credit-card"),
//        MainTabBarItemModel(title: "Settings", imageName: "settings")
    ]
}
