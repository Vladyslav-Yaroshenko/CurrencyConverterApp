//
//  SettingsTableViewCell.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 27.07.2023.
//

import UIKit
import Combine

class SettingsTableViewCell: UITableViewCell {

    // MARK: - UI Elements
    private let currencyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let selectedCurrencyLabel: UILabel = {
        let label = UILabel()
        label.text = "Selected Currency:"
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        label.textColor = .black
        return label
    }()
    
    private let countryNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter", size: 14.0)
        label.textColor = UIColor(red: 0.79, green: 0.74, blue: 0.74, alpha: 1)
        return label
    }()

    // MARK: - ViewModel
    @Published var viewModel: SettingsCellViewModel? {
        didSet {
            bindViewModel()
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
        contentView.addSubview(selectedCurrencyLabel)
        contentView.addSubview(countryNameLabel)

        currencyImageView.translatesAutoresizingMaskIntoConstraints = false
        selectedCurrencyLabel.translatesAutoresizingMaskIntoConstraints = false
        countryNameLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            selectedCurrencyLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22),
            selectedCurrencyLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),

            countryNameLabel.topAnchor.constraint(equalTo: selectedCurrencyLabel.bottomAnchor, constant: 8),
            countryNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            countryNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -22),

            currencyImageView.widthAnchor.constraint(equalToConstant: 44),
            currencyImageView.heightAnchor.constraint(equalToConstant: 44),
            currencyImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            currencyImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -18)
        ])

        contentView.heightAnchor.constraint(equalToConstant: 86).isActive = true
    }

    // MARK: - Binding
    
    private var cancellables = Set<AnyCancellable>()

//    private func bindViewModel() {
//        viewModel.imageNamePublisher
//            .sink { [weak self] imageName in
//                self?.currencyImageView.image = UIImage(named: imageName)
//            }
//            .store(in: &cancellables)
//
//        viewModel.countryNamePublisher
//            .sink { [weak self] countryName in
//                self?.countryNameLabel.text = countryName
//            }
//            .store(in: &cancellables)
//    }
    
    func bindViewModel() {
        viewModel?.$imageName
            .sink { [weak self] text in
                self?.currencyImageView.image = UIImage(named: text)
            }
            .store(in: &cancellables)
        
        viewModel?.$countryName
            .sink { [weak self] text in
                self?.countryNameLabel.text = text
            }
            .store(in: &cancellables)
    }
    
    
}



