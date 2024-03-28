
import UIKit

class TodoDetailViewController: UIViewController {
    
    var titleText: String?
    var dueDate: String?
    
    @IBOutlet weak var todoDetailTitle: UILabel!
    @IBOutlet weak var todoDueDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let titleText = titleText {
            todoDetailTitle.text = titleText
        }
        if let dueDate = dueDate {
            todoDueDate.text = dueDate
        }
        
        
    }
}
