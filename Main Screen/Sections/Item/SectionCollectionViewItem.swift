// Redux Visual Editor
// Created 30/01/2019 by Max Gribov
//

import Cocoa

class SectionCollectionViewItem: NSCollectionViewItem {

    @IBOutlet weak var backgroundView: SectionItemBackgroundView!
    @IBOutlet weak var nameLabel: NSTextField!
    @IBOutlet weak var addButton: NSButton!
    @IBOutlet weak var propertiesStackView: NSStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addButtonDidCicked(_ sender: NSButton) {
        
        
    }
}
