//
//  SettingsCellViewModelProtocol.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 27.07.2023.
//

import UIKit
//import Combine

protocol SettingsCellViewModelProtocol {
    var countryNamePublisher: Published<String>.Publisher { get }
    var imageNamePublisher: Published<String>.Publisher { get }
}
