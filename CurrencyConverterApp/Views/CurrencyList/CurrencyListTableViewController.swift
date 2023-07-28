//
//  CurrencyListTableViewController.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 26.07.2023.
//

import UIKit

class CurrencyListTableViewController: UITableViewController {
    
    let barButtonItem: UIBarButtonItem = {
        let barButton = UIBarButtonItem(barButtonSystemItem: .search, target: nil, action: nil)
        barButton.image = UIImage(named: "search")
        barButton.tintColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 0.85)
        return barButton
    }()
    
    var viewModel: CurrencyListViewModelProtocol?
    
    var searchController: UISearchController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = CurrencyListViewModel()
        
        self.navigationItem.rightBarButtonItem = barButtonItem
        barButtonItem.target = self
        barButtonItem.action = #selector(didTapSearchBar)
        tableView.register(CurrencyListTableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    @objc private func didTapSearchBar() {
        if searchController == nil {
            searchController = UISearchController()
            searchController?.searchBar.delegate = self
            searchController?.searchBar.searchTextField.backgroundColor = .lightText
            searchController?.searchBar.tintColor = .black
            navigationItem.searchController = searchController
            navigationItem.hidesSearchBarWhenScrolling = false
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
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
