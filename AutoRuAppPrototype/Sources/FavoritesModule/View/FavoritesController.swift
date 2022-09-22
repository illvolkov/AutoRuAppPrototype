//
//  FavoritesController.swift
//  AutoRuAppPrototype
//
//  Created by Ilya Volkov on 22.09.2022.
//

import UIKit

class FavoritesController: UIViewController {
    
    //MARK: - References
    
    var presenter: FavoritesPresenter?
    
    //MARK: - Views
    
    @IBOutlet weak var adsLabel: UILabel!
    @IBOutlet weak var saveAdsLabel: UILabel!
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.delegate = self
        setupSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavigationBar()
    }
    
    //MARK: - Settings
    
    private func setupNavigationBar() {
        title = "Избранное"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let menuButton = MenuButton().getButton()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menuButton)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up")?.withTintColor(.black,
                                                                                                                             renderingMode: .alwaysOriginal),
                                                            style: .plain,
                                                            target: nil,
                                                            action: nil)
    }
    
    private func setupSubviews() {
        adsLabel.font = .systemFont(ofSize: view.frame.width * 0.06, weight: .semibold)
        saveAdsLabel.font = .systemFont(ofSize: view.frame.width * 0.04)
        saveAdsLabel.alpha = 0.7
    }
}

//MARK: - FavoritesPresenterDelegate methods

extension FavoritesController: FavoritesPresenterDelegate {}
