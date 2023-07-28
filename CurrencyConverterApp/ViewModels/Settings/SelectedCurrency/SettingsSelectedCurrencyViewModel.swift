//
//  SettingsSelectedCurrencyViewModel.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 28.07.2023.
//

import Foundation

class SettingsSelectedCurrencyViewModel: SettingsSelectedCurrencyViewModelProtocol {
    
    
    private var currencies: [SettingsSelectedCurrencyCellViewModelProtocol]?
    
    private var currency = StorageManager.shared.getCurrencies()
    
    func cellViewModel(for indexPath: IndexPath) -> SettingsSelectedCurrencyCellViewModelProtocol? {
        let currency = currency[indexPath.row]
        let viewModel = SettingsSelectedCurrencyCellViewModel(imageName: "ukraine 1",
                                                              currency: currency,
                                                              isSelected: false,
                                                              selectedRowImageName: "isSelectedFalse")
        return viewModel
    }
    
    func bindData() {
        print("Binding)")
    }
    
    func numberOfRows() -> Int {
        currency.count
    }
}
