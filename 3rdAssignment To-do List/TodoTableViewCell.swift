

import UIKit

class TodoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var todoCellTitle: UILabel!
    @IBOutlet weak var todoCellSwitchButton: UISwitch!
    
    private var previousText: String?
    
    var isSwitchOn = false
    
    @IBAction func completedTodo(_ sender: UISwitch) {
        isSwitchOn = sender.isOn
        updateLabelStrikeThrough()
        
    }
    
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

extension String {
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
