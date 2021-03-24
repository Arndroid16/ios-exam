//
//  ContentView.swift
//  Exam
//
//  Created by Arnold Fanio on 3/17/21.
//

import SwiftUI
import Alamofire
import SwiftyJSON

struct PersonList: View {
    
    //@ObservedObject var obs = observer()
    @EnvironmentObject var viewModel: observer
    
    
    var body: some View {
        
        NavigationView {
            List(viewModel.datas) {
            contact in
                NavigationLink(destination: Details(contact: contact)) {
                    PersonRow(contact: contact)
                }
            }
            .navigationBarTitle("Person")
        }
        .environment(\.colorScheme, .light)
        }
    
    }


struct PersonList_Previews: PreviewProvider {
    static var previews: some View {
        PersonList()
    }
}

struct PersonRow: View {
    
    let contact : Person
    
    var body: some View {
        HStack {
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipped()
                .cornerRadius(25)
            VStack(alignment: .leading,  spacing: 2){
                HStack(spacing: 4) {
                    Text(contact.firstname)
                    Text(contact.lastname)                       
                }
                .font(
                .system(size: 22,   weight:.medium, design:.default))
                Text(contact.address)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}

class observer : ObservableObject{
     
    @Published var birthdate = ""
    @Published var datas  = [Person]()
    
    
    init() {
       
        guard let fileLocation = Bundle.main.url(forResource: "data", withExtension: "json")
        
        else {
            print("File not found")
            return
        }
        
        AF.request(fileLocation).responseData { [self] (response) in
           
            print("Response Data  \(response)")
            let json = try! JSON(data: response.data!)
            print("json\(json["data"])")
            
            
            for data in json["data"] {
                print("data\(data.1["firstname"])")
                self.birthdate = data.1["birthday"].stringValue
                
                let today = Date()
                let formatter1 = DateFormatter()
                formatter1.dateStyle = .medium
               
                let calendar = Calendar.current
                let components = calendar.dateComponents([.month, .day, .year], from: formatter1.date(from: birthdate)!, to: today)

                let ageYears = components.year
                
                self.datas.append(Person(
                    image: data.1["image"].stringValue,
                    firstname: data.1["firstname"].stringValue,
                    lastname: data.1["lastname"].stringValue,
                    emailaddress: data.1["email"].stringValue,
                    mobilenumber: data.1["mobilenumber"].stringValue,
                    address: data.1["address"].stringValue,
                    birthdate: data.1["birthday"].stringValue,
                                    age:ageYears!,
                    contactname: data.1["contactperson"].stringValue,
                    contactnumber: data.1["contactnumber"].stringValue))
                
            }
        }
    }
    
        
}
