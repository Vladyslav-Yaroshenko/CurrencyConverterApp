//
//  SettingsViewModelProtocol.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 27.07.2023.
//

import UIKit

protocol SettingsViewModelProtocol {
    func cellViewModel(for indexPath: IndexPath) -> SettingsCellViewModelProtocol?
    func numberOfRows() -> Int
}
