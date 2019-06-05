//
//  LoginInteractor.swift
//  Challenge
//
//  Created by Ana Rosa Acosta Arenas on 6/9/19.
//  Copyright © 2019 Ana Rosa Acosta Arenas. All rights reserved.
//


import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class LoginInteractor: LoginInteractorProtocol {
    var presenter: LoginPresenterProtocol?
    
    func getLoginUsers() {
        Alamofire.request(urlServiceLogin).responseObject {
            (response: DataResponse<LoginEntity>) in
            
            if let response = response.result.value {
                if let users = response.userDatabase {
                    for user in users {
                        print(user.identifier ?? "")
                        print(user.passId ?? "")
                    }
                }
                self.presenter?.usersFetchedSuccess(response)
            } else {
                self.presenter?.getUserDetailsFailed()
            }
        }
    }
}

