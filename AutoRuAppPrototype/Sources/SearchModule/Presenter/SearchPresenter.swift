//
//  SearchPresenter.swift
//  AutoRuAppPrototype
//
//  Created by Ilya Volkov on 19.09.2022.
//

import UIKit

protocol SearchPresenterDelegate: AnyObject {
    func configureView(with transports: [TransportSection])
}

class SearchPresenter {
    
    //MARK: - References
    
    weak var delegate: SearchPresenterDelegate?
    
    //MARK: - Private properties
    
    let transports = TransportSection.getData()
    
    //MARK: - Functions
    
    func configureView() {
        delegate?.configureView(with: transports)
    }
}
