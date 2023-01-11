//
//  Task.swift
//  TaskwithFirebase
//
//  Created by 이채연 on 2023/01/10.
//


import Foundation
import FirebaseFirestoreSwift
 
struct Task: Identifiable, Codable {
  @DocumentID var id: String?
  var task: String
  var time: String
  
   
  enum CodingKeys: String, CodingKey {
    case id
    case task
    case time
    
  }
}

