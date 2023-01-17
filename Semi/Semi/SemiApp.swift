//
//  SemiApp.swift
//  Semi
//
//  Created by 서종현 on 2023/01/12.
//

import SwiftUI
import Firebase

@main
struct SemiApp: App {
    @State var date = Date()
    
    
    init() {
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView(date: $date)
        }
    }
}
