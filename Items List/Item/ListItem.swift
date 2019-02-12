// Redux Visual Editor
// Created on 30/01/2019 by Max Gribov
//

import Cocoa

class ListItem: NSCollectionViewItem {
    
    struct Props {
        let name: String
        let connectInput: Command?
        let connectOutput: Command?
        
        let fields: [ListItemField.Props]
        
        let addNewField: Command?
        let newField: NewField?
        
        struct NewField {
            let dismiss: Command /// Should be called when tapped outside of new props view
            let name: String /// Name that should be rendered
            let updateName: CommandOf<String> /// Textfield updates should land here
            
            let status: Status; enum Status {
                case empty /// Indicates that name should be provided
                case valid(save: Command) /// Indictes that name is ok and entry can be saved.
                case invalid(reason: String) /// Indicates that this name cannot be added.
            }
        }
        
        static let initial = Props(
            name: "",
            connectInput: nil,
            connectOutput: nil,
            fields: [],
            addNewField: nil,
            newField: nil
        )
    }
    
    
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
        backgroundView.itemType = 0 // ???
        //properties
        for view in propertiesStackView.arrangedSubviews {
            view.removeFromSuperview()
        }
        for (index, field) in props.fields.enumerated() {
            //field stack view
            let fieldContainerStackView = NSStackView()
            fieldContainerStackView.orientation = .horizontal
            fieldContainerStackView.distribution = .fill
            fieldContainerStackView.spacing = 8.0
            fieldContainerStackView.alignment = .centerY
            //minus button
            let minusButton = ActionButton(of: .minus, target: self, action: #selector(minusButtonDidClicked(button:)))
            fieldContainerStackView.addArrangedSubview(minusButton)
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
            fieldStackView.addArrangedSubview(nameTextField)
            //type label
            let typeTextField = PropertyTextField(string: field.type)
            typeTextField.delegate = self
            typeTextField.labelStyle()
            fieldStackView.addArrangedSubview(typeTextField)
            fieldContainerStackView.addArrangedSubview(fieldStackView)
            if index == props.fields.count - 1 {
                //plus button
                let minusButton = ActionButton(of: .plus, target: self, action: #selector(plusButtonDidClicked(button:)))
                fieldContainerStackView.addArrangedSubview(minusButton)
            } else {
                //placeholder
                fieldContainerStackView.addArrangedSubview(PlaceholderView())
            }
            propertiesStackView.addArrangedSubview(fieldContainerStackView)
        }
    }
    
    @objc func minusButtonDidClicked(button: ActionButton) {
        print("minus button click")
    }
    
    @objc func plusButtonDidClicked(button: ActionButton) {
        print("plus button click")
    }
}

extension ListItem: NSTextFieldDelegate {

    //update command here
    func control(_ control: NSControl, textShouldEndEditing fieldEditor: NSText) -> Bool {
        // let textField = control as? PropertyTextField
        // text field edit
        return true
    }
}



extension NSUserInterfaceItemIdentifier {
    static let listItem = NSUserInterfaceItemIdentifier("List Item")
}

extension NSNib.Name {
    static let listItem = NSNib.Name("ListItem")
}
