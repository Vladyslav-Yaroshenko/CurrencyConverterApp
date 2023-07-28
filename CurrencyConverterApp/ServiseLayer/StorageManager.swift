//
//  StoredManager.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 28.07.2023.
//

import Foundation

class StorageManager {
    public static let shared = StorageManager()
    
    private var currencies = [String: Currency]()
    
    private init() {
        fetchDataFromJson()
    }
    
    private func fetchDataFromJson() {
        guard let url = Bundle.main.url(forResource: "country_currencies", withExtension: "json") else { return }
        do {
            let jsonData = try Data(contentsOf: url)
            let countries = try JSONDecoder().decode(Countries.self, from: jsonData)
            currencies = countries
        } catch {
            print("Error parsing JSON: \(error)")
        }
    }
    
    public func getCurrencies() -> [Currency] {
        return currencies.values.map { $0 }
    }
    
    public func getAllData() -> [String: Currency] {
        return currencies
    }
}
