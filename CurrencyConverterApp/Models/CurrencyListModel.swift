//
//  CurrencyListModel.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 26.07.2023.
//

import Foundation

struct Currency: Codable, Hashable {
    let currencyCode, currencyName: String

    enum CodingKeys: String, CodingKey {
        case currencyCode = "Currency Code"
        case currencyName = "Currency Name"
    }
}

typealias Countries = [String: Currency]
