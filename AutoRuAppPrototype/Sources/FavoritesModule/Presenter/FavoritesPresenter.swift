//
//  FavoritesPresenter.swift
//  AutoRuAppPrototype
//
//  Created by Ilya Volkov on 22.09.2022.
//

protocol FavoritesPresenterDelegate: AnyObject {}

class FavoritesPresenter {
    
    //MARK: - References
    
    weak var delegate: FavoritesPresenterDelegate?
}
