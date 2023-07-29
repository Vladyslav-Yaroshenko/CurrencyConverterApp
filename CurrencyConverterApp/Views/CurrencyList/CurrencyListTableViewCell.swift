//
//  CurrencyListTableViewCell.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 26.07.2023.
//

import UIKit

class CurrencyListTableViewCell: UITableViewCell {
    
    //MARK: - UI Elements
    let currencyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let currencyCodeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter", size: 14.0)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let currencyNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter", size: 14.0)
        label.textColor = UIColor(red: 0.79, green: 0.74, blue: 0.74, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let currencyConversionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter", size: 14.0)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - ViewModel
    weak var viewModel: CurrencyListTableViewCellViewModelProtocol? {
        willSet(viewModel) {
            currencyImageView.image = UIImage(named: viewModel?.imageName ?? "")
            currencyCodeLabel.text = viewModel?.currencyCode
            currencyNameLabel.text = viewModel?.currencyName

            // Format the double to display two decimal places
            if let amountOfMoney = viewModel?.amountOfMoney, let amountValue = Double(amountOfMoney) {
                currencyConversionLabel.text = String(format: "%.2f", amountValue) + " " + (viewModel?.currencyСonversionСode ?? "")
            } else {
                currencyConversionLabel.text = ""
            }
        }
    }

    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }

    // MARK: - NSLayoutConstraint
    private func setupViews() {
        contentView.addSubview(currencyImageView)
        contentView.addSubview(currencyCodeLabel)
        contentView.addSubview(currencyNameLabel)
        contentView.addSubview(currencyConversionLabel)

        NSLayoutConstraint.activate([
            
            currencyImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17),
            currencyImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            currencyImageView.widthAnchor.constraint(equalToConstant: 30),
            currencyImageView.heightAnchor.constraint(equalToConstant: 30),
            currencyImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            currencyImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),

            currencyCodeLabel.leadingAnchor.constraint(equalTo: currencyImageView.trailingAnchor, constant: 13),
            currencyCodeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            currencyNameLabel.leadingAnchor.constraint(equalTo: currencyCodeLabel.trailingAnchor, constant: 8),
            currencyNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            currencyConversionLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            currencyConversionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -17),
            
            
        ])
    }
}
