//
//  SettingsSelectedCurrencyCellViewModel.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 28.07.2023.
//

import Foundation
import Combine

class SettingsSelectedCurrencyCellViewModel: SettingsSelectedCurrencyCellViewModelProtocol {
    var imageName: String
    var currency: Currency
    var isSelected: Bool
    var selectedRowImageName: String
    var countryName: String

    init(imageName: String, currency: Currency, isSelected: Bool, selectedRowImageName: String, countryName: String) {
        self.imageName = imageName
        self.currency = currency
        self.isSelected = isSelected
        self.selectedRowImageName = selectedRowImageName
        self.countryName = countryName
    }
}

