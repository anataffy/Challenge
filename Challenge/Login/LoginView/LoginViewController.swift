//
//  LoginViewController.swift
//  Challenge
//
//  Created by Ana Rosa Acosta Arenas on 6/9/19.
//  Copyright © 2019 Ana Rosa Acosta Arenas. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    var presenter: LoginPresenterProtocol?
    var loginArray: [LoginEntity] = []
    
    fileprivate let emailTextField: UITextField = {
        let textField =  UITextField()
        textField.placeholder = emailPlaceholder
        textField.font = .systemFont(ofSize: 15)
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.returnKeyType = .done
        textField.clearButtonMode = .whileEditing
        textField.contentVerticalAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    fileprivate let passwordTextField: UITextField = {
        let textField =  UITextField()
        textField.placeholder = passwordPlaceHolder
        textField.font = .systemFont(ofSize: 15)
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.clearButtonMode = .whileEditing
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    fileprivate let loginImage: UIImageView = {
        let loginImage = UIImage(named: loginImageName)
        let imageView = UIImageView(image: loginImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    fileprivate let loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("Entrar", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
}

extension LoginViewController {
    fileprivate func setupLayout() {
        self.view.backgroundColor = .white
        view.addSubview(loginImage)
        loginImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginImage.topAnchor.constraint(equalTo: view.topAnchor,
                                        constant: 100).isActive = true
        loginImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        loginImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        view.addSubview(emailTextField)
        emailTextField.topAnchor.constraint(equalTo: loginImage.bottomAnchor,
                                            constant: 60).isActive = true
        emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor,
                                             constant: 10).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: view.rightAnchor,
                                              constant: -10).isActive = true
        
        view.addSubview(passwordTextField)
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor,
                                               constant: 20).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor,
                                                constant: 10).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor,
                                                 constant: -10).isActive = true
        
        view.addSubview(loginButton)
        loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        loginButton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        loginButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        loginButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
    }
    
    @objc func buttonAction(sender: UIButton!) {
        let email = emailTextField.text
        let password = passwordTextField.text
        presenter?.getLoginUsers(email ?? "",
                                 password: password ?? "")
    }
}

extension LoginViewController: LoginViewProtocol {

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

