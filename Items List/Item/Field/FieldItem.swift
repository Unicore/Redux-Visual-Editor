// Redux Visual Editor
// Created on 13/02/2019 by Max Gribov
//

import Cocoa

class FieldItem: NSCollectionViewItem {

    @IBOutlet weak var minusButton: NSButton!
    @IBOutlet weak var nameLabel: NSTextField!
    @IBOutlet weak var typeLabel: NSTextField!
    @IBOutlet weak var plusButton: NSButton!
    @IBOutlet weak var placeholderView: NSView!
    
    static let height: CGFloat = 25.0
    
    var props = Props.initial {
        didSet {
            guard isViewLoaded else { return }
            render()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        render()
    }
    
    private func render() {
        nameLabel.stringValue = props.name
        typeLabel.stringValue = props.type
        plusButton.isHidden = !props.plusButton
        placeholderView.isHidden = props.plusButton
    }
    
    @IBAction func minusButtonDidClicked(_ sender: NSButton) {
        
    }
    
    @IBAction func plusButtonDidClicked(_ sender: NSButton) {
        
    }
}

extension FieldItem: NSTextFieldDelegate {

    func control(_ control: NSControl, textShouldEndEditing fieldEditor: NSText) -> Bool {
        return true
    }
}

extension NSUserInterfaceItemIdentifier {
    static let field = NSUserInterfaceItemIdentifier("FieldItem")
}

extension NSNib.Name {
    static let field = NSNib.Name("FieldItem")
}
