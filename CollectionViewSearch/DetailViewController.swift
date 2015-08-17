import UIKit

class DetailViewController: UIViewController
{
    @IBOutlet var label: UILabel!
    
    var labelText: String = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        label.text = labelText
    }
}
