//
//  GarageController.swift
//  AutoRuAppPrototype
//
//  Created by Ilya Volkov on 22.09.2022.
//

import UIKit

class GarageController: UIViewController {
    
    //MARK: - References
    
    var presenter: GaragePresenter?
    
    //MARK: - Private properties
    
    private var promotions = [PromotionSection]()
    
    //MARK: - Views
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.delegate = self
        setupCollectionView()
        presenter?.configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavigationBar()
    }
    
    //MARK: - Settings
    
    private func setupNavigationBar() {
        navigationItem.title = "Гараж"
        
        let menuButton = MenuButton().getButton()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menuButton)
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        appearance.shadowColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = setupCompositionalLayout()
        collectionView.register(UINib(nibName: PromoCollectionViewCell.identifier, bundle: nil),
                                forCellWithReuseIdentifier: PromoCollectionViewCell.identifier)
        collectionView.register(UINib(nibName: PromoWithButtonCollectionViewCell.identifier, bundle: nil),
                                forCellWithReuseIdentifier: PromoWithButtonCollectionViewCell.identifier)
        collectionView.register(UINib(nibName: DiscountCollectionViewCell.identifier, bundle: nil),
                                forCellWithReuseIdentifier: DiscountCollectionViewCell.identifier)
    }
    
    //MARK: - CollectionView layout
    
    private func setupCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
            let section = self.promotions[sectionIndex]
            switch section.type {
            case .promoWithButton:
                return self.createPromoWithButtonSection()
            case .promo:
                return self.createPromoSection()
            case .discount:
                return self.createDiscountSection()
            }
        }
        return layout
    }
    
    private func createPromoWithButtonSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(view.frame.width * 1.37))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0)
        return section
    }
    
    private func createPromoSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(view.frame.width * 1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: itemSize.heightDimension)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        group.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: nil, top: nil, trailing: nil, bottom: NSCollectionLayoutSpacing.flexible(10))
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 13, bottom: 6, trailing: 13)
        return section
    }
    
    private func createDiscountSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 7)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(view.frame.width * 0.78), heightDimension: .absolute(view.frame.width * 0.35))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 13, bottom: 20, trailing: 13)
        return section
    }
}

//MARK: - GaragePresenterDelegate methods

extension GarageController: GaragePresenterDelegate {
    func configureView(with promotions: [PromotionSection]) {
        self.promotions = promotions
    }
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource methods

extension GarageController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        promotions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        promotions[section].promotions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = promotions[indexPath.section]
        let promotion = section.promotions[indexPath.row]
        
        switch section.type {
        case .promoWithButton:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PromoWithButtonCollectionViewCell.identifier,
                for: indexPath) as? PromoWithButtonCollectionViewCell else { return UICollectionViewCell() }
            cell.configure(with: promotion)
            return cell
        case .discount:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: DiscountCollectionViewCell.identifier,
                for: indexPath) as? DiscountCollectionViewCell else { return UICollectionViewCell() }
            cell.configure(with: promotion)
            return cell
        case .promo:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PromoCollectionViewCell.identifier,
                for: indexPath) as? PromoCollectionViewCell else { return UICollectionViewCell() }
            cell.configure(with: promotion)
            return cell
        }
    }
}
