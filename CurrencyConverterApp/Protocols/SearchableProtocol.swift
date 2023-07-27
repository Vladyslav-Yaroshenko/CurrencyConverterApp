//
//  SearchableProtocol.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 27.07.2023.
//

import Foundation

protocol SearchableProtocol: AnyObject {
    var isSearching: Bool { set get }
    var filteredCurrencies: [Currency]? { get set }
    func searchCurrencies(with searchText: String)
}
