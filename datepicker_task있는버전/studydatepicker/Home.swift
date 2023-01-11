//
//  Home.swift
//  studydatepicker
//
//  Created by 이채연 on 2023/01/03.
//

import SwiftUI

struct Home: View {
    @State var currentDate: Date = Date()
    @State private var showPopup = false
    var body: some View {
        ScrollView(.vertical,showsIndicators: false){
            VStack(spacing: 20){
                CustomDatePicker(currentDate: $currentDate)
            }
            .padding(.vertical)
        }
        .safeAreaInset(edge: .bottom) {
            HStack{
                Button {
                    showPopup.toggle()
                } label: {
                    Text("Add Task")
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue, in: Capsule())
                    }
                    .sheet(isPresented: $showPopup){
                    TaskList()
                    }
            }
            .padding(.horizontal)
            .padding(.top,10)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
