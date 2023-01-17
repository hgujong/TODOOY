//
//  Main.swift
//  Semi
//
//  Created by 서종현 on 2023/01/12.
//

import SwiftUI

struct Main: View {
    @Binding var isLoggedIn: Bool
    @Binding var date: Date
    @State private var selection: Tab = .home
    
    enum Tab {
        case home
        case friend
    }
    
    var body: some View {
        TabView(selection: $selection) {
            MainHome(isLoggedIn: $isLoggedIn, date: $date)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(Tab.home)
            FriendHome()
                .tabItem {
                    Label("Friend", systemImage: "person")
                }
                .tag(Tab.friend)
        }
        .accentColor(.blue)
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main(isLoggedIn: .constant(false), date: .constant(.now))
    }
}
