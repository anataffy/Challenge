//
//  ContactsEntity.swift
//  Challenge
//
//  Created by Ana Rosa Acosta Arenas on 6/10/19.
//  Copyright © 2019 Ana Rosa Acosta Arenas. All rights reserved.
//

import ObjectMapper

class ContactsEntity: Mappable {
    var contactsDatabase: [ContactsDatabase]?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        contactsDatabase <- map["contactsDatabase"]
    }
}

class ContactsDatabase: Mappable {
    var identifier: String?
    var name: String?
    var phone: String?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        identifier  <- map["identifier"]
        name        <- map["name"]
        phone       <- map["phone"]
    }
}
