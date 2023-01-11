//
//  TasksViewModel.swift
//  TaskwithFirebase
//
//  Created by 이채연 on 2023/01/10.
//


import Foundation
import Combine
import FirebaseFirestore
 
class TasksViewModel: ObservableObject {
  @Published var tasks = [Task]()
   
  private var db = Firestore.firestore()
  private var listenerRegistration: ListenerRegistration?
   
  deinit {
    unsubscribe()
  }
   
  func unsubscribe() {
    if listenerRegistration != nil {
      listenerRegistration?.remove()
      listenerRegistration = nil
    }
  }
   
  func subscribe() {
    if listenerRegistration == nil {
      listenerRegistration = db.collection("tasklist").addSnapshotListener { (querySnapshot, error) in
        guard let documents = querySnapshot?.documents else {
          print("No documents")
          return
        }
         
        self.tasks = documents.compactMap { queryDocumentSnapshot in
          try? queryDocumentSnapshot.data(as: Task.self)
        }
      }
    }
  }
   
  func removeTasks(atOffsets indexSet: IndexSet) {
    let tasks = indexSet.lazy.map { self.tasks[$0] }
    tasks.forEach { task in
      if let documentId = task.id {
        db.collection("tasklist").document(documentId).delete { error in
          if let error = error {
            print("Unable to remove document: \(error.localizedDescription)")
          }
        }
      }
    }
  }
 
   
}
