import UIKit

struct Todo {
    var id: Int
    var title: String
    var isCompleted: Bool
}

extension Todo {
    static var data: [Todo] = [

        
    ]
    
    static func addTodoList(title: String, isCompleted: Bool = false) {
            let newId = data.count
            let newTodo = Todo(id: newId, title: title, isCompleted: isCompleted)
            data.append(newTodo)
        }
}
