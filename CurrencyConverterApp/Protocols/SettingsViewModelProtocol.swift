//
//  SettingsViewModelProtocol.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 27.07.2023.
//

import UIKit

protocol SettingsViewModelProtocol: ObservableObject {
    func cellViewModel(for indexPath: IndexPath) -> (any SettingsCellViewModelProtocol)?
    func numberOfRows() -> Int
}
