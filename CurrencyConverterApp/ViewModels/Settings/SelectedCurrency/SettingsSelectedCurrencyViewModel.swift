//
//  SettingsSelectedCurrencyViewModel.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 28.07.2023.
//

import Foundation
import Combine

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
    
    func bindData(indexPath: IndexPath, viewModel: SettingsCellViewModel?) {
        let currency = currency[indexPath.row]
        let country = StorageManager.shared.getAllData().first(where: {$0.value.currencyCode == currency.currencyCode} )
        
        viewModel?.countryName = country?.key ?? "FAIL"
        
    }
    
    func numberOfRows() -> Int {
        currency.count
    }
    
}

