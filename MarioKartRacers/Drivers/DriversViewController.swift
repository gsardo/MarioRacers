//
//  DriversViewController.swift
//  MarioKartRacers
//
//  Created by Giuseppe Sardo on 12/9/2022.
//

import UIKit

protocol DriversView: AnyObject {
    func refresh(with state: DriversState)
}

enum DriversState {
    case loaded
    case error
}

final class DriversViewController: UIViewController {
    
    private let viewModel = DriverViewModel()
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(DriverCell.self, forCellReuseIdentifier: DriverCell.reuseIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        viewModel.view = self
        Task {
            await populateDriverData()
        }
    }
}

private extension DriversViewController {
    func populateDriverData() async {
        await viewModel.populateDriverData()
    }
    
    func configureUI() {
        title = "Mario Kart - Super Drivers"
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.dataSource = self
        
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

extension DriversViewController: DriversView {
    func refresh(with state: DriversState) {
        switch state {
        case .loaded:
            tableView.reloadData()
        case .error:
            // some error state
            break
        }
    }
}

extension DriversViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.drivers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DriverCell.reuseIdentifier, for: indexPath) as? DriverCell else {
            fatalError("DriverCell is not defined!")
        }

        let driver = viewModel.drivers[indexPath.row]
        cell.configure(driver)
        
        return cell
    }
}
