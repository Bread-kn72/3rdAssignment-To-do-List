
import UIKit

class TodoDetailViewController: UIViewController {
    
    var titleText: String?
    var dueDate: String?
    
    @IBOutlet weak var todoDetailTitle: UILabel!
    @IBOutlet weak var todoDueDate: UILabel!
    @IBOutlet weak var dDayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //옵셔널 스트링이기에 if let으로 투두의 텍스트를 가져옴
        if let titleText = titleText {
            todoDetailTitle.text = titleText
        }
        if let dueDate = dueDate {
            todoDueDate.text = dueDate
        }
        
        // 디데이 표시
        dDayLabel.text = "\(String(describing: calculateDDay(targetDate: dueDate!)!))일 남았습니다."
    }
    
    //날짜 계산
    func calculateDDay(targetDate: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        
        guard let today = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: Date()), let target = dateFormatter.date(from: dueDate!) else {
            return nil
        }
        
        let components = Calendar.current.dateComponents([.day], from: today, to: target)
        
        return String(components.day!)
    }
}
