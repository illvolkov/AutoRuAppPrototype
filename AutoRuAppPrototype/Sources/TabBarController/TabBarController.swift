//
//  TabBarController.swift
//  AutoRuAppPrototype
//
//  Created by Ilya Volkov on 19.09.2022.
//

import UIKit

class TabBarController: UITabBarController {
    
    //MARK: - Module building
    
    private let searchController = ModuleBuilder.buildSearchModule()
    private let favoritesController = ModuleBuilder.buildFavoritesModule()
    private let adsController = ModuleBuilder.buildAdsModule()
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        setupViewControllers()
    }
    
    //MARK: - Settings
    
    private func setupTabBar() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .white
        tabBar.scrollEdgeAppearance = appearance
        tabBar.standardAppearance = appearance
        tabBar.tintColor = .black
    }
    
    private func generate(viewController: UIViewController, title: String, imageName: String, selectedImageName: String) -> UIViewController {
        viewController.tabBarItem = UITabBarItem(title: title,
                                                 image: UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal),
                                                 selectedImage: UIImage(named: selectedImageName)?.withRenderingMode(.alwaysOriginal))
        return viewController
    }
        
    private func setupViewControllers() {
        setViewControllers([
            generate(viewController: searchController, title: "Поиск", imageName: "searchImage", selectedImageName: "searchImageSelected"),
            generate(viewController: favoritesController, title: "Избранное", imageName: "favoritesImage", selectedImageName: "favoritesImageSelected"),
            generate(viewController: adsController, title: "Разместить", imageName: "adsImage", selectedImageName: "adsImageSelected")
        ], animated: true)
    }

}
