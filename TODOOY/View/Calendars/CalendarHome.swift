// 
//  CalendarHome.swift
//  TODO
//
//  Created by 서종현 on 2022/12/22.
//

import SwiftUI

struct CalendarHome: View {
    @Binding var isLoggedIn: Bool
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false
    
    var body: some View {
        NavigationView {
            List {
                Calendar().padding([.horizontal])
                
                StopwatchView()
            }
            .listStyle(.inset)
            .navigationTitle("Calendar")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost(isLoggedIn: $isLoggedIn)
                    .environmentObject(ModelData())
            }
        }
    }
}

struct CalendarHome_Previews: PreviewProvider {
    static var previews: some View {
        CalendarHome(isLoggedIn: .constant(false))
            .environmentObject(ModelData())
    }
}
