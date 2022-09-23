//
//  ChatTableViewCell.swift
//  AutoRuAppPrototype
//
//  Created by Ilya Volkov on 22.09.2022.
//

import UIKit

class ChatTableViewCell: UITableViewCell {
    
    //MARK: - Identifier
    
    static let identifier = "ChatTableViewCell"

    //MARK: - Views
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var chatImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var lastMessageLabel: UILabel!
    
    //MARK: - Settings
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let contentViewWidth = self.frame.width
        
        dateLabel.font = .systemFont(ofSize: contentViewWidth * 0.032)
        dateLabel.alpha = 0.7
        
        titleLabel.font = .systemFont(ofSize: contentViewWidth * 0.043, weight: .medium)
        descriptionLabel.font = .systemFont(ofSize: contentViewWidth * 0.039)
        lastMessageLabel.font = .systemFont(ofSize: contentViewWidth * 0.035)
        lastMessageLabel.alpha = 0.7
    }
    
    func configure(with model: Chat) {
        dateLabel.text = model.dateOfLastMessage
        chatImage.image = UIImage(named: model.image)
        titleLabel.text = model.title
        descriptionLabel.text = model.subTitle
        lastMessageLabel.text = model.lastMessage
    }
}
