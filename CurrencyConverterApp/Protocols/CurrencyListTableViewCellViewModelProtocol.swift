//
//  CurrencyListTableViewCellViewModelProtocol.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 26.07.2023.
//

import Foundation

protocol CurrencyListTableViewCellViewModelProtocol: AnyObject {
    var imageName: String { get set }
    var currencyCode: String { get set }
    var currencyName: String { get set }
    var amountOfMoney: String { get set }
    var currencyСonversionСode: String { get set }
}
