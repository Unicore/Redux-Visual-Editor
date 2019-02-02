// Redux Visual Editor
// Created on 29/01/2019 by Max Gribov
//

import Cocoa

class FooterViewController: NSViewController {

    @IBOutlet weak var searchField: NSSearchField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (view as? ColorView)?.backgroundColor = NSColor(named: .footerBackground)
    }
}

//MARK: - NSSearchFieldDelegate

extension FooterViewController: NSSearchFieldDelegate {
    
}
