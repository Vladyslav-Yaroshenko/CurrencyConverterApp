//
//  SettingsCellViewModel.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 27.07.2023.
//

import Combine

class SettingsCellViewModel: SettingsCellViewModelProtocol {
    
    @Published var countryName: String = "Ukraine"
    @Published var imageName: String = "ukraine 1"
    
    var countryNamePublisher: Published<String>.Publisher { $countryName }
    var imageNamePublisher: Published<String>.Publisher { $imageName }
}