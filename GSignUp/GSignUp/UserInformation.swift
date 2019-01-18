//
//  UserInformation.swift
//  GSignUp
//
//  Created by 정건휘 on 18/01/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import Foundation

class UserInformation {
    static let shared: UserInformation = UserInformation()
    
    var id: String?
    var password: String?
    var checkPassword: String?
}
