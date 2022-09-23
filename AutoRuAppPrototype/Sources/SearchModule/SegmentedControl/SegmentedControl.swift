//
//  SegmentedControl.swift
//  AutoRuAppPrototype
//
//  Created by Ilya Volkov on 19.09.2022.
//

import UIKit

class SegmentedControl: UIView {
    
    //MARK: - References
    
    weak var delegate: SegmentedControlViewDelegate?
    
    //MARK: - Private properties
    
    private var vStacks = [UIStackView]()
    private var lineViews = [UIView]()
    private var selectedIndex = 0
    private var titleLabels = [UILabel]()
    private var config: SegmentedControlConfiguration?
    
    //MARK: - Views
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = CGSize(width: .zero, height: 50)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    //MARK: - Initial
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: - Settings
    
    private func setupHierarchy() {
        addSubview(scrollView)
    }
    
    private func setupLayout() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        scrollView.rightAnchor.constraint(equalTo: rightAnchor, constant: -15).isActive = true
        scrollView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.11).isActive = true
    }
    
    private func createHStack(_ spacing: CGFloat) -> UIStackView {
        let hStack = UIStackView()
        hStack.translatesAutoresizingMaskIntoConstraints = false
        hStack.spacing = spacing
        hStack.axis = .horizontal
        hStack.distribution = .fill
        return hStack
    }
    
    private func layoutMainStackView(_ stackView: UIStackView) {
        scrollView.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        stackView.heightAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.11).isActive = true
    }
    
    private func createVStack() -> UIStackView {
        let vStack = UIStackView()
        vStack.spacing = 8
        vStack.axis = .vertical
        vStack.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(selectionHandler))
        vStack.addGestureRecognizer(tap)
        return vStack
    }
    
    private func createLabel(_ title: String, _ font: UIFont, _ unselectedColor: UIColor) -> UILabel {
        let label = UILabel()
        label.text = title
        label.font = font
        label.isUserInteractionEnabled = false
        label.textAlignment = .center
        label.textColor = unselectedColor
        label.adjustsFontSizeToFitWidth = true
        return label
    }
    
    private func createLineView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 2).isActive = true
        view.isUserInteractionEnabled = false
        view.backgroundColor = .gray
        view.alpha = 0.8
        return view
    }
    
    private func layoutElements(_ config: SegmentedControlConfiguration, _ stackView: UIStackView) {
        config.titles.forEach { title in
            let vStack = createVStack()
            
            let label = createLabel(title, config.font, config.unselectedLabelColor)
            
            stackView.addArrangedSubview(vStack)
            
            let lineView = createLineView()
            vStack.addArrangedSubview(label)
            vStack.addArrangedSubview(lineView)
            
            lineViews.append(lineView)
            titleLabels.append(label)
            vStacks.append(vStack)
        }
    }
    
    func configure(_ config: SegmentedControlConfiguration) {
        self.config = config
        let hStack = createHStack(config.spacing)
        layoutMainStackView(hStack)
        layoutElements(config, hStack)
        lineViews[selectedIndex].backgroundColor = config.selectedLineColor
        titleLabels[selectedIndex].textColor = config.selectedLabelColor
    }
    
    //MARK: - Actions
    
    @objc private func selectionHandler(_ sender: UITapGestureRecognizer) {
        guard let view = sender.view as? UIStackView, let config = config else { return }
        
        if let index = vStacks.firstIndex(of: view) {
            lineViews[selectedIndex].backgroundColor = .clear
            titleLabels[selectedIndex].textColor = config.unselectedLabelColor
            lineViews[selectedIndex].backgroundColor = config.unselectedLabelColor
            lineViews[index].backgroundColor = config.selectedLineColor
            titleLabels[index].textColor = config.selectedLabelColor
            selectedIndex = index
            delegate?.segmentedControl(didChange: selectedIndex)
        }
    }
}
