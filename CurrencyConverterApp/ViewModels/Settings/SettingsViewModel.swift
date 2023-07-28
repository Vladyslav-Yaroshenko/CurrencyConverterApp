//
//  SettingsViewModel.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 27.07.2023.
//

import UIKit
import Combine

class SettingsViewModel: SettingsViewModelProtocol {

    @Published private var cellViewModels: [any SettingsCellViewModelProtocol] = []

    func cellViewModel(for indexPath: IndexPath) -> (any SettingsCellViewModelProtocol)? {
        return cellViewModels[indexPath.row]
    }

    func numberOfRows() -> Int {
        return cellViewModels.count
    }

    init(cellViewModels: [SettingsCellViewModel]? = [SettingsCellViewModel()]) {
        self.cellViewModels = cellViewModels ?? [SettingsCellViewModel()]
    }
}


