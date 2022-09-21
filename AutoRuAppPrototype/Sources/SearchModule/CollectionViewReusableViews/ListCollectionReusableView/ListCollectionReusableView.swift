//
//  ListCollectionReusableView.swift
//  AutoRuAppPrototype
//
//  Created by Ilya Volkov on 20.09.2022.
//

import UIKit

class ListCollectionReusableView: UICollectionReusableView {
    
    //MARK: - Identifier
    
    static let identifier = "ListCollectionReusableView"
    
    //MARK: - Settings

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 0, height: 10)
        self.layer.shadowRadius = 10
    }
}
