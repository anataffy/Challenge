//
//  ContactsInterface.swift
//  Challenge
//
//  Created by Ana Rosa Acosta Arenas on 6/10/19.
//  Copyright © 2019 Ana Rosa Acosta Arenas. All rights reserved.
//

import UIKit

protocol ContactsPresenterProtocol {
    var view: ContactsViewProtocol? {get set}
    var interactor: ContactsInteractorProtocol? {get set}
    var router: ContactsRouterProtocol? {get set}
    func fetchContacts()
    func contactsFetchedSuccess(_ response: [ContactsDatabase])
    func getContactsDetailsFailed()
    func showAlertMessage(_ viewController: UIViewController,title: String, message: String)
}

protocol ContactsViewProtocol {
    func showLoader()
    func hideLoader()
    func showContactsList(_ contactsArray: [ContactsDatabase])
    func showAlertMessage(title: String, message: String)
}

protocol ContactsInteractorProtocol {
    var presenter: ContactsPresenterProtocol? {get set}
    func fetchContacts()
}

protocol ContactsRouterProtocol {
    static func createModule() -> ContactsViewController
    func pushToViewController(_ navigationController: UINavigationController)
    func presentError(_ viewController: UIViewController, title: String , message: String)
}


