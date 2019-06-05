//
//  LoginRouter.swift
//  Challenge
//
//  Created by Ana Rosa Acosta Arenas on 6/9/19.
//  Copyright © 2019 Ana Rosa Acosta Arenas. All rights reserved.
//

import UIKit
class LoginRouter: LoginRouterProtocol {
    static func createModule() -> LoginViewController {
        let view = LoginViewController()
        var presenter: LoginPresenterProtocol = LoginPresenter()
        var interactor: LoginInteractorProtocol = LoginInteractor()
        let router: LoginRouterProtocol = LoginRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return view
    }
    
    func pushToViewController(_ navigationController: UINavigationController) {
        let contactVc = ContactsRouter.createModule()
        navigationController.pushViewController(contactVc, animated: true)
    }
    
    func presentError(_ viewController: UIViewController, title: String , message: String) {
        viewController.showAlertMessage(title , message: message )
    }
}
