//
//  MainHome.swift
//  Semi
//
//  Created by 서종현 on 2023/01/12.
//

import SwiftUI
import Firebase

struct MainHome: View {
    @Binding var isLoggedIn: Bool
    @ObservedObject var model = ViewModel()
    @Binding var date: Date
    @State private var showingProfile = false
    @State private var showTask = false
    
    var picked: String {
        dateToString(date: date, format: "YYYY MM dd")
    }
    
    var body: some View {
        
        NavigationView {
            
            List {
                Calendar(date: $date)
                
                Button {
                    model.getTodoData(date: picked)
                    showTask.toggle()
                } label: {
                    HStack {
                        Text("THINGS TO DO")
                            .bold()
                        
                        Spacer()
                        
                        Image(systemName: "chevron.compact.right")
                    }
                    .sheet(isPresented: $showTask) {
                        TaskList(date: $date)
                    }
                }
            }
            .listStyle(.inset)
            .navigationTitle("TODOY")
            .toolbar {
                Button {
                    model.getUserData()
                    print("----------------------")
                    print(model.username)
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileSummary(isLoggedIn: $isLoggedIn, image: Image("ProfilePic"))
            }
        }
    }
    
    func dateToString(date: Date, format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        return dateFormatter.string(from: date)
    }
}

struct MainHome_Previews: PreviewProvider {
    static var previews: some View {
        MainHome(isLoggedIn: .constant(false), date: .constant(.now))
    }
}
