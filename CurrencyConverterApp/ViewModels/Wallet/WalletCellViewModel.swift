//
//  WalletCellViewModel.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 31.07.2023.
//

import Foundation

class WalletCellViewModel {
    var imageName: String
    var currencyCode: String
    var ownedAmount: String
    var amonut: String
    
    init(imageName: String, currencyCode: String, ownedAmount: String, amonut: String) {
        self.imageName = imageName
        self.currencyCode = currencyCode
        self.ownedAmount = ownedAmount
        self.amonut = amonut
    }
}
