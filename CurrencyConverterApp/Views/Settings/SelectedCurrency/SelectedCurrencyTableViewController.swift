//
//  SelectedCurrencyTableViewController.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 28.07.2023.
//

import UIKit

class SelectedCurrencyTableViewController: UITableViewController {

    var viewModel: SettingsSelectedCurrencyViewModel?
    var settingsViewModel: (any SettingsViewModelProtocol)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Selected Currency"
        
        viewModel = SettingsSelectedCurrencyViewModel()
        
        tableView.register(SettingsSelectedCurrencyCell.self, forCellReuseIdentifier: "SelectedCell")

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel?.numberOfRows() ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectedCell", for: indexPath) as! SettingsSelectedCurrencyCell
        cell.viewModel = viewModel?.cellViewModel(for: indexPath) as? SettingsSelectedCurrencyCellViewModel
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let settingsViewModel = settingsViewModel else { return }
        viewModel?.updateSettingsCell(with: indexPath, viewModel: settingsViewModel)
                navigationController?.popViewController(animated: true)
    }
}
