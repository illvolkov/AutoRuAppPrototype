//
//  ModuleBuilder.swift
//  AutoRuAppPrototype
//
//  Created by Ilya Volkov on 19.09.2022.
//

import UIKit

class ModuleBuilder {
    static func buildSearchModule() -> UIViewController {
        let view = SearchController(nibName: "SearchController", bundle: nil)
        let presenter = SearchPresenter()
        
        view.presenter = presenter
        presenter.delegate = view
        
        return UINavigationController(rootViewController: view)
    }
    
    static func buildFavoritesModule() -> UIViewController {
        let view = FavoritesController(nibName: "FavoritesController", bundle: nil)
        let presenter = FavoritesPresenter()
        
        view.presenter = presenter
        presenter.delegate = view
        
        return UINavigationController(rootViewController: view)
    }
    
    static func buildAdsModule() -> UIViewController {
        let view = AdsController(nibName: "AdsController", bundle: nil)
        let presenter = AdsPresenter()
        
        view.presenter = presenter
        presenter.delegate = view
        
        return UINavigationController(rootViewController: view)
    }
    
    static func buildMessagesModule() -> UIViewController {
        let view = MessagesController(nibName: "MessagesController", bundle: nil)
        let presenter = MessagesPresenter()
        
        view.presenter = presenter
        presenter.delegate = view
        
        return UINavigationController(rootViewController: view)
    }
}
