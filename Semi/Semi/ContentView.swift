//
//  ContentView.swift
//  Semi
//
//  Created by 서종현 on 2023/01/12.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore

struct ContentView: View {
    @ObservedObject var model = ViewModel()
    @Binding var date: Date
    @State var isLoggedIn = false
    
    var body: some View {
        if isLoggedIn {
            Main(isLoggedIn: $isLoggedIn, date: $date)
        }
        else {
            Login(date: $date, isLoggedIn: $isLoggedIn)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(date: .constant(.now))
    }
}
