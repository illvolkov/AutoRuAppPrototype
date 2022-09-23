//
//  PromoWithButtonCollectionViewCell.swift
//  AutoRuAppPrototype
//
//  Created by Ilya Volkov on 23.09.2022.
//

import UIKit

class PromoWithButtonCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PromoWithButtonCollectionViewCell"
    
    //MARK: - Views
    
    @IBOutlet weak var putInGarageButton: UIButton!
    @IBOutlet weak var promoImage: UIImageView!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    //MARK: - Settings

    override func awakeFromNib() {
        super.awakeFromNib()
        let contentViewWidth = self.frame.width
        
        titleLabel.font = .systemFont(ofSize: contentViewWidth * 0.085, weight: .semibold)
        subTitleLabel.font = .systemFont(ofSize: contentViewWidth * 0.055)
        putInGarageButton.titleLabel?.font = .systemFont(ofSize: contentViewWidth * 0.055, weight: .semibold)
    }
    
    func configure(with model: Promotion) {
        promoImage.image = UIImage(named: model.image)
        titleLabel.text = model.title
        subTitleLabel.text = model.subTitle
    }

}
