//
//  ContactsPresenter.swift
//  Challenge
//
//  Created by Ana Rosa Acosta Arenas on 6/10/19.
//  Copyright © 2019 Ana Rosa Acosta Arenas. All rights reserved.
//

import UIKit

class ContactsPresenter: ContactsPresenterProtocol {

    var view: ContactsViewProtocol?
    var interactor: ContactsInteractorProtocol?
    var router: ContactsRouterProtocol?
    
    func fetchContacts() {
        view?.showLoader()
        interactor?.fetchContacts()
    }
    
    func contactsFetchedSuccess(_ response: [ContactsDatabase]) {
        view?.hideLoader()
        view?.showContactsList(response)
    }
    
    func getContactsDetailsFailed() {
        view?.hideLoader()
        view?.showAlertMessage(title: "Error",
                               message: "No se obtuvo respuesta del servidor")
        
    }
    
    
    func showAlertMessage(_ viewController: UIViewController, title: String, message: String) {
        router?.presentError(viewController,
                             title: title,
                             message: message)
    }
    
}
