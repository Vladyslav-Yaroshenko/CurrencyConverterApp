//
//  CurrencyListViewModelProtocol.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 26.07.2023.
//

import Foundation

protocol CurrencyListViewModelProtocol: SearchableProtocol, TableViewModelProtocol {
    func cellViewModel(for indexPath: IndexPath) -> CurrencyListTableViewCellViewModelProtocol?
    typealias CurrentExchangeRatesCompletion = (CurrentExchangeRate?) -> Void
    func getCurrentExchangeRates(with currency: String, completion: @escaping CurrentExchangeRatesCompletion)
}
