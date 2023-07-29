//
//  SettingsSelectedCurrencyViewModelProtocol.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 28.07.2023.
//

import Foundation

protocol SettingsSelectedCurrencyViewModelProtocol: AnyObject {
    func cellViewModel(for indexPath: IndexPath) -> SettingsSelectedCurrencyCellViewModelProtocol?
    func updateSettingsCell(with indexPath: IndexPath, viewModel: any SettingsViewModelProtocol)
    func numberOfRows() -> Int
}
