//
//  SettingsSelectedCurrencyViewModelProtocol.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 28.07.2023.
//

import Foundation

protocol SettingsSelectedCurrencyViewModelProtocol: TableViewModelProtocol {
    func cellViewModel(for indexPath: IndexPath) -> SettingsSelectedCurrencyCellViewModelProtocol?
    func bindData()
}
