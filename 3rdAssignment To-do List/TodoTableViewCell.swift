

import UIKit

class TodoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var todoCellTitle: UILabel!
    @IBOutlet weak var todoCellSwitchButton: UISwitch!
    
    private var previousText: String?
    
    // 처음 데이터가 추가될때부터 스위치가 기본값은 false상태여야함, true라면 앱 시작부터 줄이 그어져 있음
    var isSwitchOn = false
    
    // 스위치가 켜져있다면 취소선 업데이트를 실행시키는 함수
    @IBAction func completedTodo(_ sender: UISwitch) {
        isSwitchOn = sender.isOn
        updateLabelStrikeThrough()
        
    }
    
    // 스위치가 켜져있을 경우, 꺼져있을 경우 취소선에 대해 각각 다른 함수 실행
    func updateLabelStrikeThrough() {
        if isSwitchOn {
            todoCellTitle.attributedText = todoCellTitle.text?.strikeThrough()
        } else {
            todoCellTitle.attributedText = todoCellTitle.text?.removeStrikeThrough()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

// TodoTableViewCell에 대한 추가 클래스, 취소선 실행과, 취소선 삭제 함수를 따로 두기위함
extension String {
    // NSMutableAttributedString 객체 생성 후 문자열 추가,addAttribute로 취소선 삽입, 아래는 그 반대
    func strikeThrough() -> NSAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(
          NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
    func removeStrikeThrough() -> NSAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        attributeString.removeAttribute(
          NSAttributedString.Key.strikethroughStyle, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
}
