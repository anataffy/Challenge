//
//  LoginPresenter.swift
//  Challenge
//
//  Created by Ana Rosa Acosta Arenas on 6/9/19.
//  Copyright © 2019 Ana Rosa Acosta Arenas. All rights reserved.
//
import UIKit

enum StatusLogin {
    case logged
    case unlogged
}

class LoginPresenter: LoginPresenterProtocol {
    var view: LoginViewProtocol?
    var interactor: LoginInteractorProtocol?
    var router: LoginRouterProtocol?
    
    var email: String?
    var password: String?
    
    func getLoginUsers(_ email: String, password: String) {
        if !email.isEmpty && !password.isEmpty {
            if email.validateEmail() {
                self.email = email
                self.password = password
                view?.showLoader()
                interactor?.getLoginUsers()
            } else {
                view?.showAlertMessage(title: generalError,
                                       message: errorInvalidEmail)
            }
        } else {
            view?.showAlertMessage(title: generalError,
                                   message: emptyData)
        }
    }
    
    
    func usersFetchedSuccess(_ responseLogin: LoginEntity) {
        view?.hideLoader()
        guard let userData = responseLogin.userDatabase else { return }
        var statusLogin: StatusLogin = .unlogged
        for user in userData
            where user.identifier == email && user.passId == password {
                statusLogin = .logged
        }
    
        switch statusLogin {
        case .logged:
            if let vc = view as? UIViewController,
                let navigationController = vc.navigationController {
                router?.pushToViewController(navigationController)
            }
        case .unlogged:
            view?.showAlertMessage(title: generalError,
                                   message: errorDataEntered)
        }
        
    }
    
    func getUserDetailsFailed() {
        view?.hideLoader()
        view?.showAlertMessage(title: generalError,
                               message: errorMessageServer)
    }
    
    func showAlertMessage(_ viewController: UIViewController, title: String, message: String) {
        router?.presentError(viewController,
                             title: title,
                             message: message)
    }    
}

