//
//  MainTabBarViewModelProtocol.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 26.07.2023.
//

import UIKit

protocol MainTabBarViewModelProtocol: AnyObject {
    var tabBarItems: [MainTabBarItemModel] { get set }
}
