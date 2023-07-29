//
//  SettingsViewModel.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 27.07.2023.
//

import UIKit
import Combine

class SettingsViewModel: SettingsViewModelProtocol {

    @Published private var cellsViewModels: [SettingsCellViewModelProtocol] = [SettingsCellViewModel()]
    
    func cellViewModel(for indexPath: IndexPath) -> SettingsCellViewModelProtocol? {
        return cellsViewModels[indexPath.row]
    }

    func numberOfRows() -> Int {
        return cellsViewModels.count
    }

}


