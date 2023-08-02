//
//  BidsViewModel.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 02.08.2023.
//

import Foundation
import Combine

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
            .receive(on: DispatchQueue.main) // Switch back to the main thread
            .sink { completion in
                switch completion {
                case .finished:
                    break // Handle success if needed
                case .failure(let error):
                    print("CASE .failure = \(error.localizedDescription)")
                }
            } receiveValue: { [weak self] convertibleCurrencies in
                self?.appendNewCell(model: convertibleCurrencies, value: value)
            }
            .store(in: &cancellables)
    }

    
    func convertСurrencyPublisher(from: String, to: String, value: String) -> AnyPublisher<ResponseFromServer, Never> {
        let urlString = getСonvertibleСurrencies + "/\(from)" + "/\(to)" + "/\(value)"
        guard let url = URL(string: urlString) else {
            return Just(.failure).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: СonvertibleСurrencies.self, decoder: JSONDecoder())
            .map { convertibleCurrencies in
                self.appendNewCell(model: convertibleCurrencies, value: value)
                return .success
            }
            .replaceError(with: .failure)
            .eraseToAnyPublisher()
    }
}

    

