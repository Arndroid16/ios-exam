//
//  Person.swift
//  Exam
//
//  Created by Arnold Fanio on 3/17/21.
//

import Foundation

// MARK: - Person
struct Person: Identifiable {
    var image : String
    var firstname : String
    var lastname : String
    var emailaddress : String
    var mobilenumber : String
    var address : String
    var birthdate: String
    var age: Int
    var contactname : String
    var contactnumber : String
    var id = UUID()
    
}


