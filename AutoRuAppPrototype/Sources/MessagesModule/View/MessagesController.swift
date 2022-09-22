//
//  MessagesController.swift
//  AutoRuAppPrototype
//
//  Created by Ilya Volkov on 22.09.2022.
//

import UIKit

class MessagesController: UIViewController {
    
    //MARK: - References
    
    var presenter: MessagesPresenter?
    
    //MARK: - Private properties
    
    private var chats = [Chat]()
    
    //MARK: - Views
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.delegate = self
        presenter?.configureView()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavigationBar()
    }
    
    //MARK: - Settings
    
    private func setupNavigationBar() {
        navigationItem.title = "Сообщения"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let menuButton = MenuButton().getButton()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menuButton)
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ChatTableViewCell", bundle: nil), forCellReuseIdentifier: ChatTableViewCell.identifier)
        tableView.separatorStyle = .none
    }
}

//MARK: - MessagesPresenterDelegate methods

extension MessagesController: MessagesPresenterDelegate {
    func configureView(with chats: [Chat]) {
        self.chats = chats
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource methods

extension MessagesController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        chats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.identifier,
                                                       for: indexPath) as? ChatTableViewCell else { return UITableViewCell() }
        cell.configure(with: chats[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.width * 0.27
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
