//
//  CurrentExchangeRate.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 28.07.2023.
//

struct CurrentExchangeRate: Codable {
    
    let baseCode: String
    let conversionRates: [String: Double]
    
    enum CodingKeys: String, CodingKey {
        case baseCode = "base_code"
        case conversionRates = "conversion_rates"
    }
}
