//
//  ContactsRouter.swift
//  Challenge
//
//  Created by Ana Rosa Acosta Arenas on 6/10/19.
//  Copyright © 2019 Ana Rosa Acosta Arenas. All rights reserved.
//

import UIKit

class ContactsRouter: ContactsRouterProtocol {
    static func createModule() -> ContactsViewController {
        let view = ContactsViewController()
        var presenter: ContactsPresenterProtocol = ContactsPresenter()
        var interactor: ContactsInteractorProtocol = ContactsInteractor()
        let router: ContactsRouterProtocol = ContactsRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    func pushToViewController(_ navigationController: UINavigationController) {
        print("push")
    }
    
    func presentError(_ viewController: UIViewController, title: String , message: String) {
        viewController.showAlertMessage(title , message: message )
    }
    
}

