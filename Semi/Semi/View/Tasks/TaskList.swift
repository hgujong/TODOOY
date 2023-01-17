//
//  TaskList.swift
//  Semi
//
//  Created by 서종현 on 2023/01/16.
//

import SwiftUI

struct TaskList: View {
    @State public var presentAddTaskSheet = false
    @ObservedObject var model = ViewModel()
    @Binding var date: Date
    
    var picked: String {
        dateToString(date: date, format: "YYYY MM dd")
    }

    var body: some View {
        NavigationView {
            List (model.todolist) { item in
                NavigationLink(destination: TaskEdit()){
                    HStack{
                        Text(item.title)
                    }

                }
                Text(item.title)
            }
            .navigationBarTitle("Todo")
            .toolbar {
                Button {
                    presentAddTaskSheet.toggle()
                } label: {
                    Image(systemName: "plus")
                }
                .sheet(isPresented: $presentAddTaskSheet){
                    TaskAdd(presentAddTaskSheet: $presentAddTaskSheet, date: $date)
                }
            }
        }
    }
    

    func dateToString(date: Date, format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        return dateFormatter.string(from: date)
    }
    
    
}

struct TaskList_Previews: PreviewProvider {
    static var previews: some View {
        TaskList(date: .constant(.now))
    }
}
