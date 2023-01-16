//
//  ContentView.swift
//  TaskwithFirebase
//
//  Created by 이채연 on 2023/01/05.
//

import SwiftUI
 
struct TaskList: View {
     
    @StateObject var viewModel = TasksViewModel() //MovieViewModel.swift
    @State var presentAddTaskSheet = false
     
     
    private var addButton: some View {
      Button(action: { self.presentAddTaskSheet.toggle() }) {
        Image(systemName: "plus")
      }
    }
     
    private func taskRowView(task: Task) -> some View {
       NavigationLink(destination: TaskDetailsView(task: task)) {
         VStack(alignment: .leading) {
             HStack {
                 Image(systemName: "checkmark")
                 Text(task.task)
                     .font(.headline)
             }
         }
       }
    }
     
    var body: some View {
      NavigationView {
        List {
          ForEach (viewModel.tasks) { task in
            taskRowView(task: task)
          }
          .onDelete() { indexSet in
            //viewModel.removeMovies(atOffsets: indexSet)
            viewModel.removeTasks(atOffsets: indexSet)
          }
        }
        .navigationBarTitle("Task")
        .navigationBarItems(trailing: addButton)
        .onAppear() {
          print("TasksListView appears. Subscribing to data updates.")
          self.viewModel.subscribe()
        }
        .sheet(isPresented: self.$presentAddTaskSheet) {
          TaskEditView() //MovieEditView.swift
        }
         
      }// End Navigation
    }// End Body
}
 
 
struct TaskList_Previews: PreviewProvider {
    static var previews: some View {
        TaskList()
    }
}
