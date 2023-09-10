//
//  TodoItem.swift
//  ToDoApp
//
//  Created by 御前政喜 on 2023/09/08.
//

import Foundation
import RealmSwift

class TodoItem: Object {
    
    @Persisted var title: String = ""
    @Persisted var timeDate: String = ""
    @Persisted var isMarked: Bool = false
    @Persisted var text: String = ""
    
  
}
