// Redux Visual Editor
// Created on 30/01/2019 by Max Gribov
//

import Cocoa

class ListItem: NSCollectionViewItem {

    @IBOutlet weak var backgroundView: ListItemBackgroundView!
    @IBOutlet weak var nameLabel: PropertyTextField!
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
        render()
    }
    
    private func render() {
        nameLabel.stringValue = props.name
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
        //properties
        for view in propertiesStackView.arrangedSubviews {
            view.removeFromSuperview()
        }
        for field in props.fields {
            //field stack view
            let fieldStackView = NSStackView()
            fieldStackView.orientation = .horizontal
            fieldStackView.distribution = .fillEqually
            fieldStackView.spacing = 8.0
            fieldStackView.alignment = .centerY
            //name label
            let nameTextField = PropertyTextField(string: field.name)
            nameTextField.labelStyle()
            nameTextField.delegate = self
            nameTextField.sendAction(on: [.appKitDefined])
            fieldStackView.addArrangedSubview(nameTextField)
            //type label
            let typeTextField = PropertyTextField(string: field.type)
            typeTextField.delegate = self
            typeTextField.labelStyle()
            fieldStackView.addArrangedSubview(typeTextField)
            propertiesStackView.addArrangedSubview(fieldStackView)
        }
    }
}

extension ListItem: NSTextFieldDelegate {

    //update command here
    func control(_ control: NSControl, textShouldEndEditing fieldEditor: NSText) -> Bool {
        let textField = control as? PropertyTextField
        print("\(textField?.stringValue)")
        return true
    }

    //TODO: remove if dont need in future
//    public func controlTextDidEndEditing(_ obj: Notification) {
//
//        let textView = obj.userInfo?["NSFieldEditor"] as? NSTextView
//        let value = textView?.textStorage?.string
//
//        print("\(value)")
//    }
    
}

extension NSUserInterfaceItemIdentifier {
    static let listItem = NSUserInterfaceItemIdentifier("List Item")
}

extension NSNib.Name {
    static let listItem = NSNib.Name("ListItem")
}
