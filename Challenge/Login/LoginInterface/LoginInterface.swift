//
//  LoginInterface.swift
//  Challenge
//
//  Created by Ana Rosa Acosta Arenas on 6/9/19.
//  Copyright © 2019 Ana Rosa Acosta Arenas. All rights reserved.
//
import UIKit

protocol LoginPresenterProtocol {
    var view: LoginViewProtocol? {get set}
    var interactor: LoginInteractorProtocol? {get set}
    var router: LoginRouterProtocol? {get set}
    func getLoginUsers(_ email: String, password: String)
    func usersFetchedSuccess(_ responseLogin: LoginEntity)
    func getUserDetailsFailed()
    func showAlertMessage(_ viewController: UIViewController,title: String, message: String)
}

protocol LoginViewProtocol {
    func showLoader()
    func hideLoader()
    func showAlertMessage(title: String, message: String)
}

protocol LoginInteractorProtocol {
    var presenter: LoginPresenterProtocol? {get set}
    func getLoginUsers()
}

protocol LoginRouterProtocol {
    static func createModule() -> LoginViewController
    func pushToViewController(_ navigationController: UINavigationController)
    func presentError(_ viewController: UIViewController, title: String , message: String)    
}

