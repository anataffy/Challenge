//
//  ContactsInteractor.swift
//  Challenge
//
//  Created by Ana Rosa Acosta Arenas on 6/10/19.
//  Copyright © 2019 Ana Rosa Acosta Arenas. All rights reserved.
//

import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class ContactsInteractor: ContactsInteractorProtocol {
    var presenter: ContactsPresenterProtocol?
    
    func fetchContacts() {
        Alamofire.request(urlServiceContacts).responseObject {
            (response: DataResponse<ContactsEntity>) in
            
            if let response = response.result.value {
                if let users = response.contactsDatabase {
                    self.presenter?.contactsFetchedSuccess(users)
                }
            } else {
                self.presenter?.getContactsDetailsFailed()
            }
        }
    }
}

