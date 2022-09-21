//
//  CarsCollectionViewCell.swift
//  AutoRuAppPrototype
//
//  Created by Ilya Volkov on 20.09.2022.
//

import UIKit

class CarsCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Identifier
    
    static let identifier = "CarsCollectionViewCell"

    //MARK: - Views
    
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var yearOfIssueLabel: UILabel!
    
    //MARK: - Settings
    
    private func setupSubViews() {
        let contentViewWidth = self.frame.width
        
        priceLabel.font = .systemFont(ofSize: contentViewWidth * 0.095, weight: .medium)
        nameLabel.font = .systemFont(ofSize: contentViewWidth * 0.095)
        yearOfIssueLabel.font = .systemFont(ofSize: contentViewWidth * 0.075, weight: .light)
    }
    
    func configure(with model: Transport) {
        carImage.image = UIImage(named: model.image ?? "")
        nameLabel.text = model.title
        priceLabel.text = model.price
        yearOfIssueLabel.text = model.subTitle
        
        setupSubViews()
    }

}
