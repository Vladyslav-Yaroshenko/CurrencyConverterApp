//
//  WalletViewModel.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 30.07.2023.
//

import Foundation
import SwiftUI

struct WalletViewModel {
    @State var ownedCurrencies: [String] = ["GBP", "ZAR", "USD", "UAH"]
    @State var totalBalance: String = "500.00"
}
