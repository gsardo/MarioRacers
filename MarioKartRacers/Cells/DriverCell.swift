//
//  DriverCell.swift
//  Mario Kart Racers
//
//  Created by Giuseppe Sardo on 12/9/2022.
//

import Foundation
import UIKit


class DriverCell: UITableViewCell {
    
    lazy var driverNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var specialSkillLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var debutTourLabel: UILabel = {
        let label =  UILabel()
        label.font = UIFont.systemFont(ofSize: 11)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // do set up here
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // do updates here
    func configure(_ driver: DriverViewModel) {
        driverNameLabel.text = driver.name
        specialSkillLabel.text = "Special skill: \(driver.specialSkill)"
        debutTourLabel.text = "Debut tour: \(driver.debutTour)"
    }
    
    private func setUpUI() {
        contentView.addSubview(driverNameLabel)
        contentView.addSubview(specialSkillLabel)
        contentView.addSubview(debutTourLabel)
    
        // add NSLayoutConstraints for name
        driverNameLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        driverNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        driverNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        // add NSLayoutConstraints for specialSkill
        specialSkillLabel.widthAnchor.constraint(equalTo: driverNameLabel.widthAnchor).isActive = true
        specialSkillLabel.topAnchor.constraint(equalTo: driverNameLabel.bottomAnchor).isActive = true
        specialSkillLabel.leadingAnchor.constraint(equalTo: driverNameLabel.leadingAnchor).isActive = true
        
        // add NSLayoutConstraints for debutTour
        debutTourLabel.widthAnchor.constraint(equalTo: specialSkillLabel.widthAnchor).isActive = true
        debutTourLabel.topAnchor.constraint(equalTo: specialSkillLabel.bottomAnchor).isActive = true
        debutTourLabel.leadingAnchor.constraint(equalTo: specialSkillLabel.leadingAnchor).isActive = true
    }
    
}
