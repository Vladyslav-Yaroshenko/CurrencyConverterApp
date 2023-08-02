//
//  BidsViewModel.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 02.08.2023.
//

import Foundation
import Combine
import SwiftUI

class BidsViewModel: ObservableObject {
   
    @Published var bids: [BidsCellViewModel] = []
    private var cancellables = Set<AnyCancellable>()
    
    
    private func appendNewCell(model: СonvertibleСurrencies?, value: String) {
        guard let model = model else { return }
        let cellViewModel = BidsCellViewModel(currencyFrom: model.baseCode,
                                              currencyTo: model.targetCode,
                                              bidValue: value,
                                              convertedValue: "\(model.conversionResult)")
        bids.append(cellViewModel)
    }
    
    func convertСurrency(from: String, to: String, value: String) {
        let urlString = getСonvertibleСurrencies + "/\(from)" + "/\(to)" + "/\(value)"
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: СonvertibleСurrencies.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break 
                case .failure(let error):
                    print("CASE .failure = \(error.localizedDescription)")
                }
            } receiveValue: { [weak self] convertibleCurrencies in
                self?.appendNewCell(model: convertibleCurrencies, value: value)
            }
            .store(in: &cancellables)
    }
}

    


