//
//  DriverCell.swift
//  Mario Kart Racers
//
//  Created by Giuseppe Sardo on 12/9/2022.
//
import UIKit

final class DriverCell: UITableViewCell {
    
    private let driverNameLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .body)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let specialSkillLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .caption1)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let debutTourLabel: UILabel = {
        let label =  UILabel()
        label.font = .preferredFont(forTextStyle: .caption1)
        label.numberOfLines = 0
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
        driverNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        driverNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        driverNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true

        // add NSLayoutConstraints for specialSkill
        specialSkillLabel.topAnchor.constraint(equalTo: driverNameLabel.bottomAnchor).isActive = true
        specialSkillLabel.leadingAnchor.constraint(equalTo: driverNameLabel.leadingAnchor).isActive = true
        specialSkillLabel.trailingAnchor.constraint(equalTo: driverNameLabel.trailingAnchor).isActive = true

        // add NSLayoutConstraints for debutTour
        debutTourLabel.topAnchor.constraint(equalTo: specialSkillLabel.bottomAnchor).isActive = true
        debutTourLabel.leadingAnchor.constraint(equalTo: specialSkillLabel.leadingAnchor).isActive = true
        debutTourLabel.trailingAnchor.constraint(equalTo: specialSkillLabel.trailingAnchor).isActive = true
        debutTourLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
    }
    
}
