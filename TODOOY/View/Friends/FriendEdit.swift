//
//  FriendEdit.swift
//  TODOOY
//
//  Created by 이채연 on 2023/01/16.
//

import SwiftUI

struct FriendEdit: View {
    var body: some View {
        VStack {
            Image(systemName: "person.crop.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100)
                .foregroundColor(Color.blue)
                .padding(.top,40)
                .padding(.bottom,40)
            HStack {
                VStack(alignment: .trailing){
                    Text("Name: ")
                        .fontWeight(.bold)
                    Text("ID: ")
                        .fontWeight(.bold)
                }
                VStack(alignment: .leading){
                    Text("chaeyeon")
                    Text("1234")
                }
            }
            Spacer()
            Button {
                
            } label: {
                Text("Delete")
            }
            .padding(.bottom,70)
        }
    }
}

struct FriendEdit_Previews: PreviewProvider {
    static var previews: some View {
        FriendEdit()
    }
}
