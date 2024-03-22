import UIKit

struct Todo {
    var id: Int
    var title: String
    var isCompleted: Bool
}

extension Todo {
    static var data: [Todo] = [
        Todo(id: 0, title: "Title1", isCompleted: false),
        Todo(id: 1, title: "Title2", isCompleted: false),
        Todo(id: 2, title: "Title3", isCompleted: false)
        
    ]
    
    static func addTodoList(title: String, isCompleted: Bool = false) {
            let newId = data.count
            let newTodo = Todo(id: newId, title: title, isCompleted: isCompleted)
            data.append(newTodo)
        }
}
