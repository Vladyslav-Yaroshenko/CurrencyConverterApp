//
//  SettingsSelectedCurrencyCellViewModelProtocol.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 28.07.2023.
//

import Foundation

protocol SettingsSelectedCurrencyCellViewModelProtocol: AnyObject {
    var imageName: String { get set }
    var currency: Currency { get set }
    var isSelected: Bool { get set }
    var selectedRowImageName: String { get set }
}
