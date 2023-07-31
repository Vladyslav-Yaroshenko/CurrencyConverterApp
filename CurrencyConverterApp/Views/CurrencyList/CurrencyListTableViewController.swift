//
//  CurrencyListTableViewController.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 26.07.2023.
//

import UIKit
import Combine

class CurrencyListTableViewController: UITableViewController, NetworkViewProtocol {
   
    private var cancellables: [AnyCancellable] = []

    var selectedSettingsViewModel = SettingsSelectedCurrencyViewModel()
    
    let barButtonItem: UIBarButtonItem = {
        let barButton = UIBarButtonItem(barButtonSystemItem: .search, target: nil, action: nil)
        barButton.image = UIImage(named: "search")
        barButton.tintColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 0.85)
        return barButton
    }()
    lazy var errorView = ErrorView()
    var viewModel: CurrencyListViewModelProtocol?
    var searchController: UISearchController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = CurrencyListViewModel()
        getData()
        
        self.navigationItem.rightBarButtonItem = barButtonItem
        barButtonItem.target = self
        barButtonItem.action = #selector(didTapSearchBar)
        tableView.register(CurrencyListTableViewCell.self, forCellReuseIdentifier: "Cell")
        
        selectedSettingsViewModel.didChangeDefaultCurrency.sink { [weak self] _ in
                    self?.getData()
                }.store(in: &cancellables)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let needToGetData = viewModel?.isCurrencyChanged() else { return }
        if needToGetData {
            getData()
        }
    }
    
    

    private func getData() {
        viewModel?.getCurrentExchangeRates(completion: { result in
            switch result {
            case.success:
                self.success()
            case .failure:
                self.failure()
            }
        })
    }
    
    func success() {
        viewModel?.getCurrencies()
        tableView.reloadData()
        removeErrorView()
    }
    
    func failure() {
        showError()
    }
    
    private func removeErrorView() {
        errorView.removeFromSuperview()
        tableView.isScrollEnabled = true
    }
    
    private func showError() {
        errorView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(errorView)
        tableView.isScrollEnabled = false
        
        NSLayoutConstraint.activate([
            errorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            errorView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150)
        ])
        
        errorView.addButtonTarget(target: self, action: #selector(didTapRetryButton), for: .touchUpInside)
    }
    
    
    @objc func didTapRetryButton() {
        getData()
    }
   
    
    @objc private func didTapSearchBar() {
        if searchController == nil {
            searchController = UISearchController()
            searchController?.searchBar.delegate = self
            searchController?.searchBar.searchTextField.backgroundColor = .lightText
            searchController?.searchBar.tintColor = .black
            navigationItem.searchController = searchController
            navigationItem.hidesSearchBarWhenScrolling = false
        } else if navigationItem.searchController == nil {
            navigationItem.searchController = searchController
        }
        searchController?.becomeFirstResponder()
    }
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CurrencyListTableViewCell
        guard let viewModel = viewModel,
              let cellViewModel = viewModel.cellViewModel(for: indexPath)
        else { return UITableViewCell() }
        cell.viewModel = cellViewModel
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
}

// MARK: - UISearchBarDelegate

extension CurrencyListTableViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        navigationItem.searchController = nil
        viewModel?.isSearching = false
        tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel?.searchCurrencies(with: searchText)
        tableView.reloadData()
    }
}
