//
//  CurrencyListViewModel.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 26.07.2023.
//

import Foundation

enum ResponseFromServer {
    case success
    case failure
}

class CurrencyListViewModel: CurrencyListViewModelProtocol {
    func isCurrencyChanged() -> Bool {
        if currentCurrency == storageManager.defaultCurrencies {
            return false
        } else {
            currentCurrency = storageManager.defaultCurrencies
            return true
        }
    }
    
    
    //MARK: - Variables
    private let storageManager = StorageManager.shared
    private let networkManager = NetworkManager()
    private var currentCurrency: String = ""
    
    var isSearching: Bool = false
    var filteredCurrencies: [Currency]?
    var currencies: [Currency] = []
    var imagesName: [String] = ["ukraine 1"]
    var currentExchangeRates: CurrentExchangeRate?
    
    typealias CurrentExchangeRatesCompletion = (ResponseFromServer) -> Void
    
    //MARK: - Initialization
    
    init() {
        
    }
    
    //MARK: - Functions
    
    func numberOfRows() -> Int {
        return isSearching ? (filteredCurrencies?.count ?? 0) : currencies.count
    }
    
    func cellViewModel(for indexPath: IndexPath) -> CurrencyListTableViewCellViewModelProtocol? {
        guard let currentExchangeRates = currentExchangeRates else { return nil }
        
        let currency: Currency
        if isSearching, let filteredCurrencies = filteredCurrencies {
            currency = filteredCurrencies[indexPath.row]
        } else {
            currency = currencies[indexPath.row]
        }
        
        let amount = currentExchangeRates.conversionRates[currency.currencyCode] ?? 0.0
        
        return CurrencyListTableViewCellViewModel(currency: currency,
                                                  imageName: "ukraine 1",
                                                  amountOfMoney: String(amount),
                                                  currencyСonversionСode: currentExchangeRates.baseCode)
    }
    
    func searchCurrencies(with searchText: String) {
        if searchText.isEmpty {
            isSearching = false
            filteredCurrencies = nil
        } else {
            isSearching = true
            filteredCurrencies = currencies.filter { $0.currencyCode.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    func getCurrentExchangeRates(completion: @escaping (ResponseFromServer) -> Void) {
        let urlString = getCurrentExchangeRate + storageManager.defaultCurrencies
        guard let url = URL(string: urlString) else {
            completion(.failure) // Notify that there was an issue with the URL
            return
        }
        
        networkManager.downloadJSON(from: url) { [weak self] response in
            switch response {
            case .success(let data):
                let currentExchangeRates = try? JSONDecoder().decode(CurrentExchangeRate.self, from: data)
                self?.currentExchangeRates = currentExchangeRates
                DispatchQueue.main.async {
                    completion(.success)
                }
                
                
            case .failure(let error):
                print("CASE .failure = \(error.localizedDescription)")
                DispatchQueue.main.async {
                    completion(.failure)
                }
            }
        }
    }
    
    func getCurrencies() {
        currencies = storageManager.getCurrencies()
        currentCurrency = storageManager.defaultCurrencies
    }
}
