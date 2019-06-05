//
//  LoginEntity.swift
//  Challenge
//
//  Created by Ana Rosa Acosta Arenas on 6/9/19.
//  Copyright © 2019 Ana Rosa Acosta Arenas. All rights reserved.
//

import ObjectMapper

class LoginEntity: Mappable {
    var userDatabase: [UserDatabase]?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        userDatabase <- map["userDatabase"]
    }
}

class UserDatabase: Mappable {    
    var identifier: String?
    var passId: String?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        identifier  <- map["identifier"]
        passId      <- map["passId"]
    }
}
