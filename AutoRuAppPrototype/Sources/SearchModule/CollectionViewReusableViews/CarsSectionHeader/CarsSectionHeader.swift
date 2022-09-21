//
//  CarsSectionHeader.swift
//  AutoRuAppPrototype
//
//  Created by Ilya Volkov on 22.09.2022.
//

import UIKit

class CarsSectionHeader: UICollectionReusableView {
    
    //MARK: - Identifier
    
    static let identifier = "CarsSectionHeader"
    
    //MARK: - Views

    @IBOutlet weak var headerLabel: UILabel!
    
    //MARK: - Settings
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        headerLabel.font = .systemFont(ofSize: self.frame.width * 0.068, weight: .semibold)
    }
    
}
