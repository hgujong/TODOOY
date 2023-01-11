//
//  TaskDetailsView.swift
//  TaskwithFirebase
//
//  Created by 이채연 on 2023/01/10.
//

import SwiftUI
 
struct TaskDetailsView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var presentEditTaskSheet = false
     
    var task: Task
     
    private func editButton(action: @escaping () -> Void) -> some View {
      Button(action: { action() }) {
        Text("Edit")
      }
    }
     
    var body: some View {
      Form {
        Section(header: Text("Task")) {
          Text(task.task)
        }
         
        Section(header: Text("Time")) {
            Text(task.time)
        }
      }
      .navigationBarTitle(task.task)
      .navigationBarItems(trailing: editButton {
        self.presentEditTaskSheet.toggle()
      })
      .onAppear() {
        print("TaskDetailsView.onAppear() for \(self.task.task)")
      }
      .onDisappear() {
        print("TaskDetailsView.onDisappear()")
      }
      .sheet(isPresented: self.$presentEditTaskSheet) {
        TaskEditView(viewModel:TaskViewModel(task: task), mode: .edit) { result in
          if case .success(let action) = result, action == .delete {
            self.presentationMode.wrappedValue.dismiss()
          }
        }
      }
    }
     
  }
 
struct TaskDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let task = Task(task: "task", time: "select time")
        return
          NavigationView {
            TaskDetailsView(task: task)
          }
    }
}
