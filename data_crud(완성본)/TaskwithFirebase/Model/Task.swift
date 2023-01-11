//
//  Task.swift
//  TaskwithFirebase
//
//  Created by 이채연 on 2023/01/10.
//


import Foundation
import FirebaseFirestoreSwift
 
struct Movie: Identifiable, Codable {
  @DocumentID var id: String?
  var title: String
  var description: String
  var year: String
   
  enum CodingKeys: String, CodingKey {
    case id
    case title
    case description
    case year
  }
}

