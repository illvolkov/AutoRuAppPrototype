//
//  DiscountCollectionViewCell.swift
//  AutoRuAppPrototype
//
//  Created by Ilya Volkov on 23.09.2022.
//

import UIKit

class DiscountCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "DiscountCollectionViewCell"
    
    //MARK: - Views
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var discountImage: UIImageView!
    @IBOutlet weak var subDiscountImage: UIImageView!
    
    //MARK: - Settings
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.font = .systemFont(ofSize: self.frame.width * 0.05, weight: .medium)
    }
    
    func configure(with model: Promotion) {
        titleLabel.text = model.title
        discountImage.image = UIImage(named: model.image)
        subDiscountImage.image = UIImage(named: model.subImage ?? "")
    }

}
