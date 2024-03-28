import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var todoTableView: UITableView!
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var today: UILabel!
    
    var todoList = Todo.data
    let cellReuseIdentifier = "todoCell"
    let nib = UINib(nibName: "TodoTableViewCell", bundle: nil)
    
    // 오늘 날짜 추가
    var dateString: String? {
        let date =  Date()                     // 넣을 데이터(현재 시간)
        let myFormatter = DateFormatter()
        myFormatter.dateFormat = "MMM/dd yyyy"  // 변환할 형식
        let dateString = myFormatter.string(from: date)
        return dateString
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        todoTableView.delegate = self
        todoTableView.dataSource = self
        // identifier 등록
        todoTableView.register(nib, forCellReuseIdentifier: cellReuseIdentifier)
        today.text = dateString
    }
    
    // tableview의 열 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    // tableview와 cell에서 표현되는 부분을 연결
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = todoTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! TodoTableViewCell
        
        let todoItem = todoList[indexPath.row]
        
        cell.todoCellTitle.text = todoItem.title
        cell.todoCellSwitchButton.isOn = todoItem.isCompleted
        cell.updateLabelStrikeThrough()
        
        return cell
    }
    
    // 우측 슬라이드 시 셀 삭제 함수 - 데이터와 셀을 모두 삭제해야하 완료
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            todoList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            Todo.data.remove(at: indexPath.row)
            
        } else if editingStyle == .insert {
            
        }
    }
    
    // 디테일 뷰 페이지 이동
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        todoTableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(TodoDetailViewController(), animated: true)
    }
    
    
    
    
    @IBAction func addTodo(_ sender: Any) {
        // 추가버튼 누를때 알람 구현
        let title = "To-do 추가"
        let message = "나의 To-do와 Due Date를 적어보세요"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let ok = UIAlertAction(title: "추가", style: .default) { (_) in
            //확인했을때 처리 할 내용
            let titleTxt = alert.textFields?[0]
            let dueDateTxt = alert.textFields?[1]
            if let newTodoTitleText = titleTxt?.text, let newTodoDuedateText = dueDateTxt?.text {
                Todo.addTodoList(title: newTodoTitleText, dueDate: newTodoDuedateText)
                print("입력값 \(Todo.data)")
                // 데이터를 한번 저장하더라도 새롭게 데이터가 바뀐다면 다시 저장해줘야함.
                self.todoList = Todo.data
            } else {
                print("입력된 값이 없습니다.")
            }
            self.todoTableView.reloadData()
        }
        
        //알람 실행
        alert.addAction(cancel)
        alert.addAction(ok)
        
        self.present(alert, animated: true)
        
        // 투두 제목 텍스트필드
        alert.addTextField() { (titleField) in
            titleField.placeholder = "작성해주세요"
            titleField.isSecureTextEntry = false
        }
        // 투두 듀데이트 텍스트필드
        alert.addTextField() { (dueDateField) in
            dueDateField.placeholder = "202x/00/00"
            dueDateField.isSecureTextEntry = false
        }
    }
    
    // edit 버튼 추가 및 addButton 감추기 함수
    @IBAction func editButtonTapped(_ sender: UIBarButtonItem) {
        if todoTableView.isEditing {
            editButton.title = "Edit"
            todoTableView.setEditing(false, animated: true)
            
            addButton.isEnabled = false
            addButton.isHidden = true
        } else {
            editButton.title = "Done"
            todoTableView.setEditing(true, animated: true)
            
            addButton.isEnabled = true
            addButton.isHidden = false
        }
    }
    // edit에서 -버튼으로 cell delete
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    
}
