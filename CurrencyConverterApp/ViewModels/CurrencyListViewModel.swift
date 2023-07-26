//
//  CurrencyListViewModel.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 26.07.2023.
//

import Foundation

class CurrencyListViewModel: CurrencyListViewModelProtocol {
    
    var currencies: [Currency] = []
    var imagesName: [String] = ["ukraine 1"]

    
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
    
    init() {
        fetchDataFromJson()
    }
    
    func numberOfRows() -> Int {
        return currencies.count
    }
    
    func cellViewModel(for indexPath: IndexPath) -> CurrencyListTableViewCellViewModelProtocol? {
        let currency = currencies[indexPath.row]
        
        return CurrencyListTableViewCellViewModel(currency: currency,
                                                  imageName: "ukraine 1",
                                                  amountOfMoney: "2100",
                                                  currencyСonversionСode: "UAH")
    }
}
