//
//  ListCollectionViewCell.swift
//  AutoRuAppPrototype
//
//  Created by Ilya Volkov on 20.09.2022.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Identifier
    
    static let identifier = "ListCollectionViewCell"

    //MARK: - Views
    
    @IBOutlet weak var parameterImage: UIImageView!
    @IBOutlet weak var parameterLabel: UILabel!
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: self.frame.width * 0.035)
        label.alpha = 0.7
        return label
    }()
    
    //MARK: - Settings
    
    private func setupContentView() {
        self.backgroundColor = .white
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 0, height: 10)
        self.layer.shadowRadius = 10
        self.layer.masksToBounds = false
    }
    
    private func addDescriptionLabel() {
        self.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: parameterLabel.bottomAnchor, constant: 1).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
    }
    
    private func setupSubviews(with model: Transport) {
        
        parameterLabel.font = .systemFont(ofSize: self.frame.width * 0.05)
        
        if model.title == "Рассчитать кредит" {
            parameterImage.translatesAutoresizingMaskIntoConstraints = false
            parameterImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
            parameterImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -21).isActive = true
            parameterImage.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.04).isActive = true
            parameterImage.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.05).isActive = true
            
            parameterLabel.translatesAutoresizingMaskIntoConstraints = false
            parameterLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
            
            addDescriptionLabel()
            setupContentView()
        }
    }
    
    func configure(with model: Transport) {
        parameterImage.image = UIImage(systemName: model.image ?? "")
        parameterLabel.text = model.title
        descriptionLabel.text = model.subTitle
        setupSubviews(with: model)
    }
}
