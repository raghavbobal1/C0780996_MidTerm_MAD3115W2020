
import UIKit

class BillTableViewCell: UITableViewCell
{
    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var lblBillId: UILabel!
    @IBOutlet weak var lblBillDate: UILabel!
    @IBOutlet weak var lblBillAmount: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        
    }

}
