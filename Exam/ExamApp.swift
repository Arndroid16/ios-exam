//
//  ExamApp.swift
//  Exam
//
//  Created by Arnold Fanio on 3/17/21.
//

import SwiftUI

@main
struct ExamApp: App {
    
@StateObject var obs = observer()
    
    var body: some Scene {
        WindowGroup {
            PersonList().environmentObject(obs)
        }
    }
}
