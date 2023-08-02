//
//  СonvertibleСurrencies.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 02.08.2023.
//

import Foundation

struct СonvertibleСurrencies: Codable {
    let baseCode: String
    let targetCode: String
    let conversionRate: Double
    let conversionResult: Double
    
    enum CodingKeys: String, CodingKey {
        case baseCode = "base_code"
        case targetCode = "target_code"
        case conversionRate = "conversion_rate"
        case conversionResult = "conversion_result"
    }
}
