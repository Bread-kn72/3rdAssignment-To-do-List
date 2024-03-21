

import UIKit

class TodoTableViewCell: UITableViewCell {

    @IBOutlet weak var todoCellTitle: UILabel!
    @IBOutlet weak var todoCellSwitchButton: UISwitch!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
