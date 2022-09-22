//
//  MessagesPresenter.swift
//  AutoRuAppPrototype
//
//  Created by Ilya Volkov on 22.09.2022.
//

protocol MessagesPresenterDelegate: AnyObject {
    func configureView(with chats: [Chat])
}

class MessagesPresenter {
    
    //MARK: - References
    
    weak var delegate: MessagesPresenterDelegate?
    
    //MARK: - Private properties
    
    private let chats = Chat.getData()
    
    //MARK: - Functions
    
    func configureView() {
        delegate?.configureView(with: chats)
    }
}
