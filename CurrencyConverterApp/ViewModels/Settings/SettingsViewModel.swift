//
//  SettingsViewModel.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 27.07.2023.
//

import Combine
import Foundation

class SettingsViewModel: SettingsViewModelProtocol, ObservableObject {

    @Published private var cellsViewModels: [any SettingsCellViewModelProtocol] = [SettingsCellViewModel()]

    func numberOfRows() -> Int {
        return cellsViewModels.count
    }

    func updateItem(countryName: String) {
        cellsViewModels[0].countryName = countryName
    }

    func cellViewModel(for indexPath: IndexPath) -> (any SettingsCellViewModelProtocol)? {
        return cellsViewModels[indexPath.row]
    }
}





