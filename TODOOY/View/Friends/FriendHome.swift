//
//  FriendHome.swift
//  TODO
// 
//  Created by 서종현 on 2022/12/22.
//

import SwiftUI

struct FriendHome: View {
    @State var addFriendSheet = false
     
    private var addButton: some View {
      Button(action: { self.addFriendSheet.toggle() }) {
        Image(systemName: "plus")
      }
    }
    
    private func friendRow() -> some View {
       NavigationLink(destination: FriendEdit()) {
         VStack(alignment: .leading) {
             HStack {
                 Image(systemName: "person")
                 Text("Chaeyeon")
                     .font(.headline)
             }
             
         }
       }
    }
    
    var body: some View {
        NavigationView{
            List {
                friendRow()
            }
            .navigationTitle("Friends")
           
            .navigationBarItems(trailing: addButton)
            .sheet(isPresented: self.$addFriendSheet) {
                AddFriend() 
            }
        }
    }
}

struct FriendHome_Previews: PreviewProvider {
    static var previews: some View {
        FriendHome()
    }
}
