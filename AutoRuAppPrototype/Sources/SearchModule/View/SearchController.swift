//
//  SearchController.swift
//  AutoRuAppPrototype
//
//  Created by Ilya Volkov on 19.09.2022.
//

import UIKit

class SearchController: UIViewController {
        
    //MARK: - References
    
    var presenter: SearchPresenter?
    
    //MARK: - Private properties
    
    private var transports = [TransportSection]()
    
    //MARK: - Views
    
    private let segmentedControl = SegmentedControl()
    private let segmentedLine: UIView = {
        let segmentedLine = UIView()
        segmentedLine.backgroundColor = .black
        return segmentedLine
    }()
    
    @IBOutlet weak var vStack: UIStackView!
    @IBOutlet weak var collectionView: UICollectionView!
        
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.delegate = self
        presenter?.configureView()
        
        setupHierarchy()
        configureSegmentedControl()
        setupCollectionView()
    }
    
    private func setupHierarchy() {
        vStack.addArrangedSubview(segmentedControl)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavigationBar()
    }
    
    //MARK: - Settings
    
    private func setupNavigationBar() {
        let image = UIImage(named: "auto.ru.logo")
        let autoRuImage = UIImageView(image: image)
        let menuButton = MenuButton().getButton()
        
        navigationItem.titleView = autoRuImage
                
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menuButton)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "navigationSearchImage")?.withRenderingMode(.alwaysOriginal),
                                                            style: .plain,
                                                            target: nil,
                                                            action: nil)
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        appearance.shadowColor = .clear
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func configureSegmentedControl() {
        let spacer = "   "
        let titles = ["Транспорт", "ПроАвто", "Кредиты", "ОСАГО", "Электромобили", "Выкуп", "Отзывы", "Журнал"].map { $0 + spacer }
        let config = SegmentedControlConfiguration(titles: titles,
                                                   font: .systemFont(ofSize: view.frame.width * 0.04),
                                                   spacing: 0,
                                                   selectedLabelColor: .black,
                                                   unselectedLabelColor: .gray,
                                                   selectedLineColor: .black)
        segmentedControl.configure(config)
        
        vStack.insertArrangedSubview(segmentedControl, at: 0)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.1).isActive = true
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.collectionViewLayout = setupCompositionalLayout()
        collectionView.register(UINib(nibName: NewsCollectionViewCell.identifier, bundle: nil),
                                forCellWithReuseIdentifier: NewsCollectionViewCell.identifier)
        
        collectionView.register(UINib(nibName: RecentlyWatchedCollectionViewCell.identifier, bundle: nil),
                                forCellWithReuseIdentifier: RecentlyWatchedCollectionViewCell.identifier)
        
        collectionView.register(UINib(nibName: ListCollectionViewCell.identifier, bundle: nil),
                                forCellWithReuseIdentifier: ListCollectionViewCell.identifier)
        
        collectionView.register(UINib(nibName: SegmentedCollectionViewCell.identifier, bundle: nil),
                                forCellWithReuseIdentifier: SegmentedCollectionViewCell.identifier)
        
        collectionView.register(UINib(nibName: CarsCollectionViewCell.identifier, bundle: nil),
                                forCellWithReuseIdentifier: CarsCollectionViewCell.identifier)
        
        collectionView.register(UINib(nibName: CarsSectionHeader.identifier, bundle: nil),
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: CarsSectionHeader.identifier)
    }
    
    //MARK: - CollectionView layout
    
    private func setupCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
            let section = self.transports[sectionIndex]
            switch section.type {
            case .news:
                return self.createNewsSection()
            case .recentlyWatched:
                return self.createRecentlyWatchedSection()
            case .list:
                return self.createListSection()
            case .listWithBackgroundView:
                return self.createListWithReusableViewSection()
            case .segmented:
                return self.createSegmentedSection()
            case .cars:
                return self.createCarsSection()
            }
        }
        layout.register(UINib(nibName: ListCollectionReusableView.identifier, bundle: nil),
                        forDecorationViewOfKind: ListCollectionReusableView.identifier)
        return layout
    }
    
    private func createNewsSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(view.frame.width * 0.3),
                                                         heightDimension: .absolute(view.frame.width * 0.32))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 13, bottom: 20, trailing: 13)
        return section
    }
    
    private func createRecentlyWatchedSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(view.frame.width * 0.6),
                                               heightDimension: .absolute(view.frame.width * 0.2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 13, bottom: 20, trailing: 13)
        return section
    }
    
    private func createSegmentedSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(view.frame.width * 0.09))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 20, trailing: 15)
        return section
    }
    
    private func createListSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(view.frame.width * 0.15))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 20, trailing: 15)
        return section
    }
    
    private func createListWithReusableViewSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 2, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(view.frame.width * 0.15))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        let backgroundItem = NSCollectionLayoutDecorationItem.background(elementKind: ListCollectionReusableView.identifier)
        
        section.decorationItems = [backgroundItem]
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 20, trailing: 15)
        return section
    }
    
    private func createCarsSection() -> NSCollectionLayoutSection {
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(view.frame.width * 0.12))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                 elementKind: UICollectionView.elementKindSectionHeader,
                                                                 alignment: .top)
        header.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0)
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 4, bottom: 5, trailing: 4)
        
        let horizontalGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let horizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: horizontalGroupSize, subitems: [item])
        
        let verticalGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(view.frame.width * 0.54))
        let verticalGroup = NSCollectionLayoutGroup.vertical(layoutSize: verticalGroupSize, subitems: [horizontalGroup])
        
        let section = NSCollectionLayoutSection(group: verticalGroup)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 13, bottom: 0, trailing: 13)
        section.boundarySupplementaryItems = [header]
        return section
    }
}

//MARK: - SearchPresenterDelegate methods

extension SearchController: SearchPresenterDelegate {
    func configureView(with transports: [TransportSection]) {
        self.transports = transports
    }
}

//MARK: - UICollectionViewDataSource, UICollectionViewDelegate methods

extension SearchController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        transports.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        transports[section].transports.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = transports[indexPath.section]
        let transport = section.transports[indexPath.row]
        switch section.type {
        case .news:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCollectionViewCell.identifier,
                                                                for: indexPath) as? NewsCollectionViewCell else { return UICollectionViewCell() }
            cell.configure(with: transport)
            return cell
        case .recentlyWatched:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecentlyWatchedCollectionViewCell.identifier,
                                                                for: indexPath) as? RecentlyWatchedCollectionViewCell else { return UICollectionViewCell() }
            cell.configure(with: transport)
            return cell
        case .list:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCollectionViewCell.identifier,
                                                                for: indexPath) as? ListCollectionViewCell else { return UICollectionViewCell() }
            cell.configure(with: transport)
            return cell
        case .listWithBackgroundView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCollectionViewCell.identifier,
                                                                for: indexPath) as? ListCollectionViewCell else { return UICollectionViewCell() }
            cell.configure(with: transport)
            return cell
        case .segmented:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SegmentedCollectionViewCell.identifier,
                                                                for: indexPath) as? SegmentedCollectionViewCell else { return UICollectionViewCell() }
            return cell
        case .cars:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarsCollectionViewCell.identifier,
                                                                for: indexPath) as? CarsCollectionViewCell else { return UICollectionViewCell() }
            cell.configure(with: transport)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: CarsSectionHeader.identifier,
            for: indexPath) as? CarsSectionHeader else { return UICollectionReusableView() }
        return header
    }
}
