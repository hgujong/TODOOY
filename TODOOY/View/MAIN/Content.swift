//
//  Content.swift
//  TODOOY
//
//  Created by 서종현 on 2023/01/06.
//

import SwiftUI

struct Content: View {
    @Binding var isLoggedIn: Bool
    @State private var selection: Tab = .calendar
    
    enum Tab {
        case calendar
        case friend
    }
    
    var body: some View {
        TabView(selection: $selection) {
            CalendarHome(isLoggedIn: $isLoggedIn)
                .tabItem {
                    Label("Calendar", systemImage: "calendar")
                }
                .tag(Tab.calendar)

            FriendHome()
                .tabItem {
                    Label("Friends", systemImage: "person")
                }
                .tag(Tab.friend)
        }
    }
}

struct Content_Previews: PreviewProvider {
    static var previews: some View {
        Content(isLoggedIn: .constant(false))
    }
}
