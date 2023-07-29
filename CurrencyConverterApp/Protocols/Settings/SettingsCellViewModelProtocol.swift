//
//  SettingsCellViewModelProtocol.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 27.07.2023.
//

import Combine

protocol SettingsCellViewModelProtocol: ObservableObject {
    var countryName: String { get set }
    var imageName: String { get set }
}
