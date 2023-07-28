//
//  CurrencyListTableViewCellViewModel.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 26.07.2023.
//

import Foundation

class CurrencyListTableViewCellViewModel: CurrencyListTableViewCellViewModelProtocol {
    
    // MARK: - Variables
    var imageName: String
    var currencyCode: String 
    var currencyName: String
    var amountOfMoney: String
    var currencyСonversionСode: String

    init(currency: Currency, imageName: String, amountOfMoney: String, currencyСonversionСode: String) {
        self.imageName = imageName
        self.currencyCode = currency.currencyCode
        self.currencyName = currency.currencyName
        self.amountOfMoney = amountOfMoney
        self.currencyСonversionСode = currencyСonversionСode
    }
    
    
}
