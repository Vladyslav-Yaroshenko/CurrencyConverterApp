//
//  CurrencyListViewModelProtocol.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 26.07.2023.
//

import Foundation

protocol CurrencyListViewModelProtocol: SearchableProtocol, TableViewModelProtocol {
    func cellViewModel(for indexPath: IndexPath) -> CurrencyListTableViewCellViewModelProtocol?
    func getCurrentExchangeRates(with currency: String, completion: @escaping (ResponseFromServer) -> Void)
    func getCurrencies()
}
