//
//  ErrorView.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 29.07.2023.
//

import Foundation
import UIKit

import UIKit


class ErrorView: UIView {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "exclamationmark.triangle.fill")
        imageView.tintColor = .red
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let errorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "Something went wrong\n while fetching data. \nPlease try again"
        return label
    }()
    
    let retryButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Retry", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.49, green: 0.64, blue: 0.4, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        
        addSubview(imageView)
        addSubview(errorLabel)
        addSubview(retryButton)
        
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            
            errorLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            errorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            errorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            retryButton.heightAnchor.constraint(equalToConstant: 40),
            retryButton.topAnchor.constraint(equalTo: errorLabel.bottomAnchor, constant: 16),
            retryButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            retryButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            retryButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
        ])
    }
    
    func addButtonTarget(target: Any?, action: Selector, for event: UIControl.Event) {
        self.retryButton.addTarget(target, action: action, for: event)
    }
}



