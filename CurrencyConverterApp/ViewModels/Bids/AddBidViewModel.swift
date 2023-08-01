//
//  AddBidViewModel.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 01.08.2023.
//

import Foundation
import SwiftUI
import Combine

class AddBidViewModel: ObservableObject {
    
    func isButtonActive(from: String, to: String, isEmpty: String) -> Bool {
        return (from != "Select Counrty Currency") && (to != "Select Counrty Currency") && (!isEmpty.isEmpty)
    }
}


//private var isFormValidPublisher: AnyPublisher<Bool, Never> {
//        Publishers.CombineLatest3(textFieldValuePublisher, selectedCountryFromPublisher, selectedCountryToPublisher)
//            .map { textFieldValue, selectedCountryFrom, selectedCountryTo in
//                return !textFieldValue.isEmpty && selectedCountryFrom != "No Country Selected" && selectedCountryTo != "No Country Selected"
//            }
//            .eraseToAnyPublisher()
//    }
