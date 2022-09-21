//
//  DriverCell.swift
//  Mario Kart Racers
//
//  Created by Giuseppe Sardo on 12/9/2022.
//

import Foundation
import UIKit


class DriverCell: UITableViewCell {
    
    private let driverNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let specialSkillLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let debutTourLabel: UILabel = {
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
    }
    
}
