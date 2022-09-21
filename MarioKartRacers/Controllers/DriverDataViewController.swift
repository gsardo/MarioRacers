//
//  DriverDataViewController.swift
//  Mario Kart Racers
//
//  Created by Giuseppe Sardo on 12/9/2022.
//

import UIKit

//this displays all driver data in a tableview
final class DriverDataViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(DriverCell.self, forCellReuseIdentifier: "DriverCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let viewModel = DriverDataViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        configureUI()
        Task {
        await populateDriverData()
        }
        tableView.dataSource = self
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
        view.backgroundColor = .white
        
        var constraints = [NSLayoutConstraint]()
        // Add
        constraints.append(tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)) //left
        constraints.append(tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)) //right
        constraints.append(tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        constraints.append(tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        // Activate
        NSLayoutConstraint.activate(constraints)
    }    
}

extension DriverDataViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.drivers.count
    }
    
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DriverCell", for: indexPath) as? DriverCell else {
            fatalError("DriverCell is not defined!")
        }

        let driver = viewModel.drivers[indexPath.row]
        cell.configure(driver)
        
        return cell
    }
}
