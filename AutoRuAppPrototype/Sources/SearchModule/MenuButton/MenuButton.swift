//
//  MenuButton.swift
//  AutoRuAppPrototype
//
//  Created by Ilya Volkov on 19.09.2022.
//

import UIKit

class MenuButton: UIButton {
    
    //MARK: - Functions
    
    func getButton() -> UIView {
        guard let menuButton = Bundle.main.loadNibNamed("MenuButton", owner: nil)?.first as? UIView else { return UIView() }
        return menuButton
    }
    
    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.1, delay: 0, options: [.beginFromCurrentState, .allowUserInteraction]) {
                self.alpha = self.isHighlighted ? 0.3 : 1
            }

        }
    }
}
