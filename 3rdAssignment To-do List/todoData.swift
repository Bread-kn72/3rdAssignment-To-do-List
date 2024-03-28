import UIKit

struct Todo {
    var id: Int
    var title: String
    var isCompleted: Bool
    var dueDate: String
}

extension Todo {
    static var data: [Todo] = [
        Todo(id: 0, title: "테스트 데이터입니다!", isCompleted: false, dueDate: "2024/07/02")
    ]
    
    // Todo extension의 data 변수에 데이터를 추가하는 함수
    static func addTodoList(title: String, isCompleted: Bool = false, dueDate: String) {
        let newId = data.count
        let newTodo = Todo(id: newId, title: title, isCompleted: isCompleted, dueDate: dueDate)
        data.append(newTodo)
        
        let todoDetailVC = TodoDetailViewController()
                todoDetailVC.titleText = title
                todoDetailVC.dueDate = dueDate
    }
}
