//
//  BidsCellViewModel.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 02.08.2023.
//

import Foundation

class BidsCellViewModel: ObservableObject, Hashable {
    static func == (lhs: BidsCellViewModel, rhs: BidsCellViewModel) -> Bool {
        return lhs.currencyFrom == rhs.currencyFrom &&
            lhs.currencyTo == rhs.currencyTo &&
            lhs.bidValue == rhs.bidValue &&
            lhs.convertedValue == rhs.convertedValue
    }
    
    func hash(into hasher: inout Hasher) {
        
        hasher.combine(currencyTo)
        hasher.combine(bidValue)
        hasher.combine(convertedValue)
    }
    
    var currencyFrom: String
    var currencyTo: String
    var bidValue: String
    var convertedValue: String
    
    init(currencyFrom: String, currencyTo: String, bidValue: String, convertedValue: String) {
        self.currencyFrom = currencyFrom
        self.currencyTo = currencyTo
        self.bidValue = bidValue
        self.convertedValue = convertedValue
    }
    
    func handleButtonTap() {
        print("Open button tapped")
    }
}

