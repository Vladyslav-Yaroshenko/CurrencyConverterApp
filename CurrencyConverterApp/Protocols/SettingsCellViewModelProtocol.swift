//
//  SettingsCellViewModelProtocol.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 27.07.2023.
//

import UIKit
import Combine

protocol SettingsCellViewModelProtocol: ObservableObject {
    var countryName: String { get }
    var imageName: String { get }
}