//
//  SettingsViewModelProtocol.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 27.07.2023.
//

import Combine
import Foundation


protocol SettingsViewModelProtocol: ObservableObject {
    func numberOfRows() -> Int
    func updateItem(countryName: String)
    func cellViewModel(for indexPath: IndexPath) -> (any SettingsCellViewModelProtocol)?
}

