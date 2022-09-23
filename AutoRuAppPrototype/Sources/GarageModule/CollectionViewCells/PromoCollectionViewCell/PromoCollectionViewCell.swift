//
//  PromoCollectionViewCell.swift
//  AutoRuAppPrototype
//
//  Created by Ilya Volkov on 23.09.2022.
//

import UIKit

class PromoCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PromoCollectionViewCell"
    
    //MARK: - Views
    
    @IBOutlet weak var promoImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    //MARK: - Settings
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let contentViewWidth = self.frame.width
        
        titleLabel.font = .systemFont(ofSize: contentViewWidth * 0.12, weight: .semibold)
        subTitleLabel.font = .systemFont(ofSize: contentViewWidth * 0.076)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.backgroundColor = .clear
    }
    
    private func setupBackgroundColorContentView(with model: Promotion) {
        
        switch model.title {
        case "Золотая карта от Колесо.ру":
            self.backgroundColor = UIColor(rgb: 0xF9F4E9)
        case "Скидка на каско и ОСАГО до 25%":
            self.backgroundColor = UIColor(rgb: 0xEAFCFD)
        case "Отчет ПроАвто в подарок!":
            self.backgroundColor = UIColor(rgb: 0xFCF4F2)
        case "Оценка автомобиля":
            self.backgroundColor = UIColor(rgb: 0xFEF5E1)
        case "Полная история вашего автомобиля":
            self.backgroundColor = UIColor(rgb: 0xCFFADF)
        case "Отзывные кампании":
            self.backgroundColor = UIColor(rgb: 0xFBE4E3)
        case "Храните страховой полис в Гараже Авто.ру":
            self.backgroundColor = UIColor(rgb: 0xDBF9C9)
        default:
            break
        }
    }
    
    func configure(with model: Promotion) {
        promoImage.image = UIImage(named: model.image)
        titleLabel.text = model.title
        subTitleLabel.text = model.subTitle
        setupBackgroundColorContentView(with: model)
    }

}
