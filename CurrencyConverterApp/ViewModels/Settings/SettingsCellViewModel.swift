//
//  SettingsCellViewModel.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 27.07.2023.
//

import Combine

class SettingsCellViewModel: ObservableObject, SettingsCellViewModelProtocol {
    @Published var countryName: String
    @Published var imageName: String

    init(countryName: String = "Ukraine", imageName: String = "ukraine 1") {
        self.countryName = countryName
        self.imageName = imageName
    }
}
