//
//  User.swift
//  Appetizers
//
//  Created by David Liongson on 4/25/22.
//

import Foundation

struct User: Codable {
    var firstName           = ""
    var lastName            = ""
    var email               = ""
    var birthDate           = Date()
    var extraNapkins        = false
    var frequentRefills     = false
    
}
