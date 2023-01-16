// 
//  CalendarHome.swift
//  TODO
//
//  Created by 서종현 on 2022/12/22.
//

import SwiftUI

struct CalendarHome: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false
    @State private var showPopup = false
    @StateObject var viewModel = TasksViewModel()
    @State var presentAddTaskSheet = false
    
    var body: some View {
        NavigationView {
            List {
                Calendar()//.padding([.horizontal])
                
                StopwatchView()
                Spacer()
                HStack{
                    Button {
                        presentAddTaskSheet.toggle()
                    } label: {
                        Text("Add Task")
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(50)
                        }
                        .sheet(isPresented: $presentAddTaskSheet){
                        TaskEditView()
                        }
                        .buttonStyle(.borderless)
                    Button {
                        showPopup.toggle()
                    } label: {
                        Text("See Task")
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(Color.purple)
                            .cornerRadius(50)
                        }
                        .sheet(isPresented: $showPopup){
                        TaskList()
                        }
                        .buttonStyle(.borderless)
                }
            }
            .listStyle(.inset)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingProfile.toggle()
                    } label: {
                        Label("User Profile", systemImage: "person.crop.circle")
                    }
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environmentObject(ModelData())
            }
            
        }
    }
}

struct CalendarHome_Previews: PreviewProvider {
    static var previews: some View {
        CalendarHome()
            .environmentObject(ModelData())
    }
}
