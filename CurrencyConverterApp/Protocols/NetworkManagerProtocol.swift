//
//  NetworkManagerProtocol.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 28.07.2023.
//

import Foundation

protocol NetworkManagerProtocol {
    func downloadJSON(from url: URL, completion: @escaping (Result<Data, Error>) -> Void)
}
