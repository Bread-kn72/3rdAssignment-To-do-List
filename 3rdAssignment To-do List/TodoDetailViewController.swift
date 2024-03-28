
import UIKit

class TodoDetailViewController: UIViewController {
    
    var titleText: String?
    var dueDate: String?
    
    @IBOutlet weak var todoDetailTitle: UILabel!
    @IBOutlet weak var todoDueDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //옵셔널 스트링이기에 if let으로 투두의 텍스트를 가져옴
        if let titleText = titleText {
            todoDetailTitle.text = titleText
        }
        if let dueDate = dueDate {
            todoDueDate.text = dueDate
        }
    }
}
