//
//  TaskwithFirebaseApp.swift
//  TaskwithFirebase
//
//  Created by 이채연 on 2023/01/05.
//

import SwiftUI
import Firebase
 
@main
struct TaskwithFirebaseApp: App {
     
    init() {
    FirebaseApp.configure()
    }
     
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
 

