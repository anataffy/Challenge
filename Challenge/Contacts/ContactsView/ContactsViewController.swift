//
//  ContactsViewController.swift
//  Challenge
//
//  Created by Ana Rosa Acosta Arenas on 6/10/19.
//  Copyright © 2019 Ana Rosa Acosta Arenas. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController {
    var presenter: ContactsPresenterProtocol?

    var contactList: [ContactsDatabase] = []
    fileprivate weak var tableNews: UITableView!
    fileprivate let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        presenter?.fetchContacts()
        self.view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        self.navigationController?.isNavigationBarHidden = false
        title = "Lista de contactos disponibles "
    }
    
    override func loadView() {
        super.loadView()
        let tableNews = UITableView(frame: .zero, style: .plain)
        tableNews.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tableNews)
        NSLayoutConstraint.activate([
            tableNews.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableNews.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableNews.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableNews.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
            ])
        self.tableNews = tableNews
    }
    
    private func setupViews() {
        refreshControl.addTarget(self, action: #selector(reloadData), for: .valueChanged)
        self.tableNews.delegate = self
        self.tableNews.dataSource = self
        self.tableNews.separatorStyle = .singleLine
        self.tableNews.estimatedRowHeight = 100
        self.tableNews.rowHeight = UITableView.automaticDimension
        self.tableNews.register(ContactsCell.self, forCellReuseIdentifier: contactCellId)
        self.tableNews.refreshControl = self.refreshControl
    }
    
    @objc private func reloadData() {
        presenter?.fetchContacts()
        refreshControl.endRefreshing()
    }
}

extension ContactsViewController: ContactsViewProtocol {
    func showContactsList(_ contactsArray: [ContactsDatabase]) {
        self.contactList = contactsArray
        self.tableNews.reloadData()
    }
    
    func showLoader() {
        self.showProgressIndicator()
    }
    
    func hideLoader() {
        self.hideProgressIndicator()
    }
    
    func showAlertMessage(title: String, message: String) {
        self.presenter?.showAlertMessage(self, title: title,
                                         message: message)
    }
    
}

extension ContactsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //  TODO: Add logic
    }
}

extension ContactsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contactList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: contactCellId, for: indexPath) as! ContactsCell
        cell.contact = contactList[indexPath.row]
        return cell
    }
}
