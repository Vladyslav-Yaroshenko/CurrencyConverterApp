//
//  NetworkManager.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 28.07.2023.
//

import Foundation

class NetworkManager: NetworkManagerProtocol {
    
    func downloadJSON(from url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                let noDataError = NSError(domain: "NoData", code: 0, userInfo: nil)
                completion(.failure(noDataError))
                return
            }
            
            completion(.success(data))
        }
        dataTask.resume()
    }
}


