//
//  AdsPresenter.swift
//  AutoRuAppPrototype
//
//  Created by Ilya Volkov on 22.09.2022.
//

protocol AdsPresenterDelegate: AnyObject {}

class AdsPresenter {
    
    //MARK: - References
    
    weak var delegate: AdsPresenterDelegate?
}
