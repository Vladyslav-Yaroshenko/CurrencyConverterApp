//
//  SelectedCurrencyTableViewController.swift
//  CurrencyConverterApp
//
//  Created by Vlad on 28.07.2023.
//

import UIKit

class SelectedCurrencyTableViewController: UITableViewController {

    var viewModel: SettingsSelectedCurrencyViewModelProtocol?
    var settingsCellViewModel: SettingsCellViewModel?
    
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
        guard let viewModel = viewModel,
              let cellViewModel = viewModel.cellViewModel(for: indexPath)
        else { return UITableViewCell() }
        cell.viewModel = cellViewModel as? SettingsSelectedCurrencyCellViewModel
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.bindData(indexPath: indexPath, viewModel: settingsCellViewModel)
        navigationController?.popViewController(animated: true)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
