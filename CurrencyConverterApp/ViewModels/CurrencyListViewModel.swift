//
//  CurrencyListViewModel.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 26.07.2023.
//

import Foundation

class CurrencyListViewModel: CurrencyListViewModelProtocol {
    
    //MARK: - Variables
    
    var isSearching: Bool = false
    var filteredCurrencies: [Currency]?
    var currencies: [Currency] = []
    var imagesName: [String] = ["ukraine 1"]

    init() {
        fetchDataFromJson()
    }
    
    //MARK: - Functions
    
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
        return isSearching ? (filteredCurrencies?.count ?? 0) : currencies.count
    }
    
    func cellViewModel(for indexPath: IndexPath) -> CurrencyListTableViewCellViewModelProtocol? {
        var currency: Currency
        
        if isSearching, let filteredCurrencies = filteredCurrencies {
            currency = filteredCurrencies[indexPath.row]
        } else {
            currency = currencies[indexPath.row]
        }
        
        return CurrencyListTableViewCellViewModel(currency: currency,
                                                  imageName: "ukraine 1",
                                                  amountOfMoney: "2100",
                                                  currencyСonversionСode: "UAH")
    }

    func searchCurrencies(with searchText: String) {
            if searchText.isEmpty {
                isSearching = false
                filteredCurrencies = []
            } else {
                isSearching = true
                filteredCurrencies = currencies.filter { $0.currencyCode.lowercased().contains(searchText.lowercased()) }
            }
        }
}
