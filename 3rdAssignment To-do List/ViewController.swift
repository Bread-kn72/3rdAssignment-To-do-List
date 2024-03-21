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
//        registerXib()
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
    
}


