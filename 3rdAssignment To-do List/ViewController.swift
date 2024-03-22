import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var todoTableView: UITableView!
    
    let todoList = Todo.data
    let cellReuseIdentifier = "todoCell"
    let nib = UINib(nibName: "TodoTableViewCell", bundle: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        todoTableView.delegate = self
        todoTableView.dataSource = self
        // identifier 수정
        todoTableView.register(nib, forCellReuseIdentifier: cellReuseIdentifier)
    }
    
//    private func registerXib() {
//        let nibName = UINib(nibName: "TodoTableViewCell", bundle: nil)
//        todoTableView.register(nibName, forCellReuseIdentifier: cellReuseIdentifier)
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = todoTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! TodoTableViewCell
        
        let todoItem = todoList[indexPath.row]
        cell.todoCellTitle.text = todoItem.title
        cell.todoCellSwitchButton.isOn = todoItem.isCompleted
        
        return cell
    }
    
    
    
    
    // 추가버튼 구현
    @IBAction func addTodo(_ sender: Any) {
        let title = "To-do 추가"
        let message = "나의 To-do를 적어보세요"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let ok = UIAlertAction(title: "추가", style: .default) { (_) in
            //확인했을때 처리 할 내용
            let txt = alert.textFields?.first
            if txt?.text?.isEmpty != true {
                Todo.data.append(Todo(id: <#Int#>, title: (txt!.text!), isCompleted: false))
                print("입력값 \(txt!.text!)")
            } else {
                print("입력된 값이 없습니다.")
            }
                
        }
        
        alert.addAction(cancel)
        alert.addAction(ok)
        
        self.present(alert, animated: true)
        
        alert.addTextField() { (tf) in
            tf.placeholder = "작성해주세요"
            tf.isSecureTextEntry = false
        }
    }
}


