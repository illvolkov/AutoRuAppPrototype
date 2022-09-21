//
//  RecentlyWatchedCollectionViewCell.swift
//  AutoRuAppPrototype
//
//  Created by Ilya Volkov on 20.09.2022.
//

import UIKit

class RecentlyWatchedCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Identifier
    
    static let identifier = "RecentlyWatchedCollectionViewCell"
    
    //MARK: - Views
    
    @IBOutlet weak var brandLogo: UIImageView!
    @IBOutlet weak var carName: UILabel!
    @IBOutlet weak var parametersLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let contentViewWidth = self.frame.width
        
        self.layer.cornerRadius = contentViewWidth * 0.1
        self.layer.masksToBounds = true
        
        carName.font = .systemFont(ofSize: contentViewWidth * 0.07)
        parametersLabel.font = .systemFont(ofSize: contentViewWidth * 0.048)
        parametersLabel.alpha = 0.7
    }
    
    //MARK: - Settings
    
    func configure(with model: Transport) {
        brandLogo.image = UIImage(named: model.image ?? "")
        carName.text = model.title
        parametersLabel.text = model.subTitle
    }

}
