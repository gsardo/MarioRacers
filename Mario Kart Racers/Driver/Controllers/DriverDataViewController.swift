//
//  DriverDataViewController.swift
//  Mario Kart Racers
//
//  Created by Giuseppe Sardo on 12/9/2022.
//

import Foundation
import UIKit

class DriverDataViewController: UITableViewController {
    
    private let viewModel = DriverDataViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        Task {
        await populateDriverData()
        }
    }
    
    private func populateDriverData() async {
        await viewModel.populateDriverData(url: Constants.Urls.drivers)
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    private func configureUI() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Mario Kart - Super Drivers"
        tableView.register(DriverCell.self, forCellReuseIdentifier: "DriverCell")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.drivers.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DriverCell", for: indexPath) as? DriverCell else {
            fatalError("DriverCell is not defined!")
        }

        let driver = viewModel.drivers[indexPath.row]
        cell.configure(driver)
        
        return cell
    }
    
}
