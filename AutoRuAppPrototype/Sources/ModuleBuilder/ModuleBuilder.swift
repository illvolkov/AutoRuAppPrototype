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
}
