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
    var currentExchangeRates: CurrentExchangeRate?
    
    private var storageManager = StorageManager.shared
    private var networkManager = NetworkManager()

    init() {
        self.currencies = storageManager.getCurrencies()
        getCurrentExchangeRates(with: "UAH")
    }
    
    //MARK: - Functions
    
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
                                                  amountOfMoney: "11",
                                                  currencyСonversionСode: "USD")
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
    
    func getCurrentExchangeRates(with currency: String) {
        let urlString = getCurrentExchangeRate + currency
        guard let url = URL(string: urlString) else { return }
        
        print(url.absoluteString)
        
        networkManager.downloadJSON(from: url) { response in
            switch response {
            case .success(let data):
                do {
                    let currentExchangeRates = try? JSONDecoder().decode(CurrentExchangeRate.self, from: data)
                    self.currentExchangeRates = currentExchangeRates
                    
                    
                }
            case .failure(let error):
                print("CASE .failure = \(error.localizedDescription)")
            }
        }
    }
}
