//
//  AdsController.swift
//  AutoRuAppPrototype
//
//  Created by Ilya Volkov on 22.09.2022.
//

import UIKit

class AdsController: UIViewController {
    
    //MARK: - References
    
    var presenter: AdsPresenter?
    
    //MARK: - Views

    @IBOutlet weak var sellLabel: UILabel!
    @IBOutlet weak var addAdsLabel: UILabel!
    @IBOutlet weak var enterPromoCodeButton: UIButton!
    @IBOutlet weak var placeForFreeButton: UIButton!
    
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
        navigationItem.title = "Объявления"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let menuButton = MenuButton().getButton()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menuButton)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle")?.withTintColor(.black,
                                                                                                                             renderingMode: .alwaysOriginal),
                                                            style: .plain,
                                                            target: nil,
                                                            action: nil)
    }
    
    private func setupSubviews() {
        let viewWidth = view.frame.width
        
        sellLabel.font = .systemFont(ofSize: viewWidth * 0.06, weight: .semibold)
        addAdsLabel.font = .systemFont(ofSize: viewWidth * 0.04)
        addAdsLabel.alpha = 0.7
        enterPromoCodeButton.titleLabel?.font = .systemFont(ofSize: viewWidth * 0.045, weight: .medium)
        placeForFreeButton.titleLabel?.font = .systemFont(ofSize: viewWidth * 0.045, weight: .medium)
    }
}

extension AdsController: AdsPresenterDelegate {}
