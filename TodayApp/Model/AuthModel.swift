//
//  AuthModel.swift
//  TodayApp
//
//  Created by Mikha's Book on 03/08/22.
//

import Foundation

class AuthModel {
    var name: String
    var email: String
    var password: String
    var passwordConfirmation: String
    
    init () {
        name = ""
        email = ""
        password = ""
        passwordConfirmation = ""
    }
}
