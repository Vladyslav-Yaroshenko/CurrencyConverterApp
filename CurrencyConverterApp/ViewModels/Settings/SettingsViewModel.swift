//
//  SettingsViewModel.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 27.07.2023.
//

import UIKit
import Combine

class SettingsViewModel: SettingsViewModelProtocol {

    private var cellViewModels: [SettingsCellViewModelProtocol] = [SettingsCellViewModel()]
    
    func cellViewModel(for indexPath: IndexPath) -> SettingsCellViewModelProtocol? {
        return cellViewModels[indexPath.row]
    }

    func numberOfRows() -> Int {
        return cellViewModels.count
    }

}


