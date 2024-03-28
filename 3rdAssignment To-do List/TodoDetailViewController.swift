
import UIKit

class TodoDetailViewController: UIViewController {
    
    var todoData = Todo.data
    
    @IBOutlet weak var todoDetailTitle: UILabel!
    @IBOutlet weak var todoDueDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    
    }
    
    func setupUI() {
//        todoDetailTitle.text = 
//        todoDueDate.text =
    }
}
