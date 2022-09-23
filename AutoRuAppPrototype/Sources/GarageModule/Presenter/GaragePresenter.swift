//
//  GaragePresenter.swift
//  AutoRuAppPrototype
//
//  Created by Ilya Volkov on 22.09.2022.
//

protocol GaragePresenterDelegate: AnyObject {
    func configureView(with promotions: [PromotionSection])
}

class GaragePresenter {
    
    //MARK: - References
    
    weak var delegate: GaragePresenterDelegate?
    
    //MARK: - Private properties
    
    private var promotions = PromotionSection.getData()
    
    //MARK: - Functions
    
    func configureView() {
        delegate?.configureView(with: promotions)
    }
}
