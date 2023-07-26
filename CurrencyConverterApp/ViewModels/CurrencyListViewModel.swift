//
//  CurrencyListViewModel.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 26.07.2023.
//

import Foundation

class CurrencyListViewModel: CurrencyListViewModelProtocol {
    
    var currencies: [Currency] = []

    
    func fetchDataFromJson() {
        guard let url = Bundle.main.url(forResource: "country_currencies", withExtension: "json") else { return }
        do {
            let jsonData = try Data(contentsOf: url)
            let countries = try JSONDecoder().decode(Countries.self, from: jsonData)
            currencies = countries.values.map { $0 }
        } catch {
            print("Error parsing JSON: \(error)")
        }
    }
    
    func numberOfRows() -> Int {
        return currencies.count
    }
}
