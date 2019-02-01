// Redux Visual Editor
// Created 30/01/2019 by Max Gribov
//

import Cocoa

class ListItem: NSCollectionViewItem {

    @IBOutlet weak var backgroundView: ListItemBackgroundView!
    @IBOutlet weak var nameLabel: NSTextField!
    @IBOutlet weak var addButton: NSButton!
    @IBOutlet weak var propertiesStackView: NSStackView!
    
    @IBAction func addButtonDidCicked(_ sender: NSButton) {}
    
    var props = Props.initial {
        didSet {
            guard isViewLoaded else { return }
            render()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    private func render() {
        backgroundView.itemType = {
            switch props.kind {
            case .action(_):
                return 0
            case .state(_,_):
                return 1
            case .props(_):
                return 2
            }
        }()
    }
    
}

extension NSUserInterfaceItemIdentifier {
    static let sectionItem = NSUserInterfaceItemIdentifier("Section Item")
}

extension NSNib.Name {
    static let sectionItem = NSNib.Name("ListItemBackgroundView")
}
