//
//  SettingsSelectedCurrencyCellViewModelProtocol.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 28.07.2023.
//

import Foundation

protocol SettingsSelectedCurrencyCellViewModelProtocol: AnyObject {
    var imageName: String { get }
    var currency: Currency { get }
    var isSelected: Bool { get }
    var selectedRowImageName: String { get }
    var countryName: String { get }
}
