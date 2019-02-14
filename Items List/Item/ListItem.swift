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
    @IBOutlet weak var nameLabel: NSTextField!
    @IBOutlet weak var addButton: NSButton!
    @IBOutlet weak var fieldsCollectionView: NSCollectionView!

    var props = Props.initial {
        didSet {
            guard isViewLoaded else { return }
            render()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupFieldsCollectionView()
        registerItems()
        render()
    }
    
    private func render() {
        nameLabel.stringValue = props.name
        
        if props.fields.count > 0 {
            addButton.isHidden = true
            fieldsCollectionView.enclosingScrollView?.isHidden = false
            fieldsCollectionView.reloadData()
        } else {
            addButton.isHidden = false
            fieldsCollectionView.enclosingScrollView?.isHidden = true
        }
    }
    
    @IBAction func addButtonDidCicked(_ sender: NSButton) {}
    
    deinit {
        NotificationCenter.default.removeObserver(
            self,
            name: NSView.frameDidChangeNotification,
            object: self.collectionView
        )
    }
}

extension ListItem: NSTextFieldDelegate {

    func control(_ control: NSControl, textShouldEndEditing fieldEditor: NSText) -> Bool {
        //TODO: nameLabel update command here
        return true
    }
}

//MARK: - Fields CollectionView

extension ListItem {
    
    fileprivate func setupFieldsCollectionView() {
        fieldsCollectionView.backgroundColors = [NSColor.clear]
        fieldsCollectionView.enclosingScrollView?.borderType = .noBorder
        fieldsCollectionView.postsFrameChangedNotifications = true
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(fieldsCollectionViewFrameDidChanged),
            name: NSView.frameDidChangeNotification,
            object: self.fieldsCollectionView
        )
    }
    
    func registerItems() {
        guard let nib = NSNib(nibNamed: .field, bundle: Bundle.main) else {
            return
        }
        fieldsCollectionView.register(nib, forItemWithIdentifier: .field)
    }
    
    @objc func fieldsCollectionViewFrameDidChanged(_ notification: Notification) {
        fieldsCollectionView.collectionViewLayout?.invalidateLayout()
    }
}

//MARK: - NSCollectionViewDataSource

extension ListItem: NSCollectionViewDataSource {
    
    private func item(for indexPath: IndexPath) -> FieldItem.Props {
        let index = indexPath.item
        guard props.fields.indices.contains(index) else {
            fatalError("\(#function) item index out of bounds")
        }
        let field = props.fields[index]
        if index == props.fields.count - 1 {
            return FieldItem.Props(name: field.name, type: field.type, plusButton: true)
        } else {
            return FieldItem.Props(name: field.name, type: field.type, plusButton: false)
        }
    }
    
    public func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return props.fields.count
    }
    
    public func collectionView(
        _ collectionView: NSCollectionView,
        itemForRepresentedObjectAt indexPath: IndexPath ) -> NSCollectionViewItem {
        guard let cell = collectionView.makeItem(withIdentifier: .field, for: indexPath) as? FieldItem
            else {
                fatalError("\(#function) failed to create an instance of FieldItem")
        }
        let props = item(for: indexPath)
        cell.props = props
        return cell
    }
}

//MARK: - NSCollectionViewDelegate

extension ListItem: NSCollectionViewDelegate {
    
}

extension ListItem: NSCollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: NSCollectionView,
        layout collectionViewLayout: NSCollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> NSSize {
        return CGSize(width: fieldsCollectionView.bounds.width, height: FieldItem.height)
    }
}

extension NSUserInterfaceItemIdentifier {
    static let listItem = NSUserInterfaceItemIdentifier("List Item")
}

extension NSNib.Name {
    static let listItem = NSNib.Name("ListItem")
}
