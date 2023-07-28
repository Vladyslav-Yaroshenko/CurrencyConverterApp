//
//  SettingsSelectedCurrencyCell.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 28.07.2023.
//

import UIKit

class SettingsSelectedCurrencyCell: UITableViewCell {

    //MARK: - UI Elements
    let currencyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()

    let currencyCodeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter", size: 14.0)
        label.textColor = .black
        return label
    }()

    let currencyNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter", size: 14.0)
        label.textColor = UIColor(red: 0.79, green: 0.74, blue: 0.74, alpha: 1)
        return label
    }()
    
    let isSelectedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // MARK: - ViewModel
    weak var viewModel: SettingsSelectedCurrencyCellViewModel? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            currencyImageView.image = UIImage(named: viewModel.imageName)
            currencyCodeLabel.text = viewModel.currency.currencyCode
            currencyNameLabel.text = viewModel.currency.currencyName
            isSelectedImageView.image = UIImage(named: viewModel.selectedRowImageName)?.withTintColor(UIColor(red: 0.96,
                                                                                                              green: 0.96,
                                                                                                              blue: 0.96,
                                                                                                              alpha: 1))
            
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
        contentView.addSubview(isSelectedImageView)

        currencyImageView.translatesAutoresizingMaskIntoConstraints = false
        currencyCodeLabel.translatesAutoresizingMaskIntoConstraints = false
        currencyNameLabel.translatesAutoresizingMaskIntoConstraints = false
        isSelectedImageView.translatesAutoresizingMaskIntoConstraints = false

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
            
            isSelectedImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            isSelectedImageView.widthAnchor.constraint(equalToConstant: 30),
            isSelectedImageView.heightAnchor.constraint(equalToConstant: 30),
            isSelectedImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -17)
        ])
    }
}
