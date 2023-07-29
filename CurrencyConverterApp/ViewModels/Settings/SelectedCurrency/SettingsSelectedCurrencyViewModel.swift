//
//  SettingsSelectedCurrencyViewModel.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 28.07.2023.
//

import Combine
import Foundation

class SettingsSelectedCurrencyViewModel: SettingsSelectedCurrencyViewModelProtocol {

    private var currencies: [SettingsSelectedCurrencyCellViewModel] = {
        var currencies = [SettingsSelectedCurrencyCellViewModel]()
        let currencyData = StorageManager.shared.getAllData()
        for (country, currency) in currencyData {
            currencies.append(SettingsSelectedCurrencyCellViewModel(imageName: "ukraine 1",
                                                                    currency: currency,
                                                                    isSelected: false,
                                                                    selectedRowImageName: "isSelectedFalse",
                                                                    countryName: country))
        }
        return currencies
    }()

    func cellViewModel(for indexPath: IndexPath) -> SettingsSelectedCurrencyCellViewModelProtocol? {
        return currencies[indexPath.row]
    }

    func numberOfRows() -> Int {
        return currencies.count
    }

    func updateSettingsCell(with indexPath: IndexPath, viewModel: any SettingsViewModelProtocol) {
        guard let selectedViewModel = cellViewModel(for: indexPath) else { return }
        viewModel.updateItem(countryName: selectedViewModel.countryName)
    }
}


