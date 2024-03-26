import UIKit

struct Todo {
    var id: Int
    var title: String
    var isCompleted: Bool
}

extension Todo {
    static var data: [Todo] = []
    
    // Todo extension의 data 변수에 데이터를 추가하는 함수
    static func addTodoList(title: String, isCompleted: Bool = false) {
            let newId = data.count
            let newTodo = Todo(id: newId, title: title, isCompleted: isCompleted)
            data.append(newTodo)
        }
}
