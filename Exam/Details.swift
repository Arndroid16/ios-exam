//
//  Details.swift
//  Exam
//
//  Created by Arnold Fanio on 3/18/21.
//

import SwiftUI

struct Details: View {
    let contact: Person
    
    var body: some View {
        VStack {
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .clipped()
                .cornerRadius(150)
                .shadow(radius: 3)
            HStack(spacing: 4) {
                Text(contact.firstname)
                    .font(.title)
                    .fontWeight(.medium)
                Text(contact.lastname)
                    .font(.title)
                    .fontWeight(.medium)
            }
            
                
            Form {
                Section {
                    HStack {
                        Text("Age")
                        Spacer()
                        Text("\(contact.age)")
                            .foregroundColor(.gray)
                            .font(.callout)
                    }
                    HStack {
                        Text("Phone")
                        Spacer()
                        Text(contact.mobilenumber)
                            .foregroundColor(.gray)
                            .font(.callout)
                    }
                    HStack {
                        Text("Email")
                        Spacer()
                        Text(contact.emailaddress)
                            .foregroundColor(.gray)
                            .font(.callout)
                    }
                    HStack {
                        Text("Address")
                        Spacer()
                        Text(contact.address)
                            .foregroundColor(.gray)
                            .font(.callout)
                            .frame(width: 180)
                    }
                }
                Section {
                    HStack {
                        Text("Contact Person")
                        Spacer()
                        Text(contact.contactname)
                            .foregroundColor(.gray)
                            .font(.callout)
                    }
                    HStack {
                        Text("Contact Person's phone number")
                        Spacer()
                        Text(contact.contactnumber)
                            .foregroundColor(.gray)
                            .font(.callout)
                    }
                }
            }
        }
        .environment(\.colorScheme, .light)
    }
}

struct Details_Previews: PreviewProvider {
    static var previews: some View {
        Details(contact: Person(image: "", firstname: "", lastname: "", emailaddress: "", mobilenumber: "", address: "", birthdate: "", age: 0, contactname: "", contactnumber: ""))
            .padding(.top, 60)
    }
}
