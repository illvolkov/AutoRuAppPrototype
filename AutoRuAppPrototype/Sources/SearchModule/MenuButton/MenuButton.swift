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
}
