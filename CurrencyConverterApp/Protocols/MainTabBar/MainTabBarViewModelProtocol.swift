//
//  MainTabBarViewModelProtocol.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 26.07.2023.
//

import UIKit
import SwiftUI

protocol MainTabBarViewModelProtocol: AnyObject {
    var tabBarItems: [MainTabBarItemModel] { get set }
    func createViewController(viewController: UIViewController, tag: MainControllers) -> UIViewController
    func createSwiftUIController(someView: some View, tag: MainControllers) -> UIViewController
}
