//
//  Home.swift
//  ElegantTaskApp
//
//  Created by 이채연 on 2023/01/03.
//

import SwiftUI

struct Home: View {
    @State var currentDate: Date = Date()
    @State private var showPopup = false
    @StateObject var viewModel = TasksViewModel() //MovieViewModel.swift
    @State var presentAddTaskSheet = false
    
    
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
                    presentAddTaskSheet.toggle()
                } label: {
                    Text("Add Task")
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                    }
                    .sheet(isPresented: $presentAddTaskSheet){
                    TaskEditView()
                    }
                Button {
                    showPopup.toggle()
                } label: {
                    Text("See Task")
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                    }
                    .sheet(isPresented: $showPopup){
                    TaskList()
                    }
                
            }
            .padding(.horizontal)
            .padding(.bottom,30)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
