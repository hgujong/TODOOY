//
//  TaskViewModel.swift
//  TaskwithFirebase
//
//  Created by 이채연 on 2023/01/10.
//

import Foundation
import Combine
import FirebaseFirestore
 
class TaskViewModel: ObservableObject {
   
  @Published var task: Task
  @Published var modified = false
   
  private var cancellables = Set<AnyCancellable>()
   
  init(task: Task = Task(task: "", time: "")) {
    self.task = task
     
    self.$task
      .dropFirst()
      .sink { [weak self] task in
        self?.modified = true
      }
      .store(in: &self.cancellables)
  }
   
  // Firestore
   
  private var db = Firestore.firestore()
   
  private func addTask(_ task: Task) {
    do {
      let _ = try db.collection("tasklist").addDocument(from: task)
    }
    catch {
      print(error)
    }
  }
   
  private func updateTask(_ task: Task) {
    if let documentId = task.id {
      do {
        try db.collection("tasklist").document(documentId).setData(from: task)
      }
      catch {
        print(error)
      }
    }
  }
   
  private func updateOrAddTask() {
    if let _ = task.id {
      self.updateTask(self.task)
    }
    else {
      addTask(task)
    }
  }
   
  private func removeTask() {
    if let documentId = task.id {
      db.collection("tasklist").document(documentId).delete { error in
        if let error = error {
          print(error.localizedDescription)
        }
      }
    }
  }
   
  // UI handlers
   
  func handleDoneTapped() {
    self.updateOrAddTask()
  }
   
  func handleDeleteTapped() {
    self.removeTask()
  }
   
}
