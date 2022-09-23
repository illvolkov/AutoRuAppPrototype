//
//  NewsCollectionViewCell.swift
//  AutoRuAppPrototype
//
//  Created by Ilya Volkov on 20.09.2022.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Identifier
    
    static let identifier = "NewsCollectionViewCell"
    
    //MARK: - Views
    
    @IBOutlet weak var newsImage: UIImageView!
    
    //MARK: - Settings
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = self.frame.width * 0.1
        self.layer.masksToBounds = true
    }
    
    func configure(with model: Transport) {
        newsImage.image = UIImage(named: model.image ?? "")
    }

}
