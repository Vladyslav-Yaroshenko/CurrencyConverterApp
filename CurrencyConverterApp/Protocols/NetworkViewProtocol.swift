//
//  NetworkViewProtocol.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 30.07.2023.
//

import Foundation

protocol NetworkViewProtocol: AnyObject {
    func success()
    func failure()
}
