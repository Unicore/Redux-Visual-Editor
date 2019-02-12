// Redux Visual Editor
// Created on 01.02.19 by Maxim Bazarov
//

import Cocoa

class ItemsListViewController: NSViewController {

    struct Props {
        let items: [ListItem.Props] // List of items
        let addNewItem: Command // show adding new item UI
        let newEntry: NewEntry? // present when need to render new item ui
        
        struct NewEntry {
            let dismiss: Command // hides new item ui
            
            let name: String // current name of new item
            let updateName: CommandOf<String> // updates the name of new item
            
            let status: Status; enum Status {
                case empty // when no save is possible yet
                case valid(save: Command) // name is ok and can be saved
                case invalid(reason: String) // name is not ok and here is the reason for this
            }
        }
        
        static let initial = Props(
            items: [],
            addNewItem: .nop,
            newEntry: nil
        )
    }
    
    @IBOutlet weak var headerView: ColorView!
    @IBOutlet weak var addButton: NSButton!
    @IBOutlet weak var collectionView: NSCollectionView!
    
    @IBAction func addButtonDidClicked(_ sender: NSButton) {
        props.addNewItem.execute()
    }

    var props = Props.initial {
        didSet {
            guard isViewLoaded else { return }
            render()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.collectionViewLayout = ItemsListViewFlowLayout()
        collectionView.postsFrameChangedNotifications = true
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(collectionViewFrameDidChanged(_:)),
            name: NSView.frameDidChangeNotification,
            object: self.collectionView)
        
        headerView.backgroundColor = NSColor(named: .headerBackground)
        
        guard let nib = NSNib(nibNamed: .listItem, bundle: Bundle.main) else {
            fatalError("cannot load nib \(NSNib.Name.listItem)")
        }
        
        collectionView.register(nib, forItemWithIdentifier: .listItem)
    }
    
    private func render() {
        collectionView.reloadData()
    }
    
    @objc func collectionViewFrameDidChanged(_ notification: Notification) {
        collectionView.collectionViewLayout?.invalidateLayout()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(
            self,
            name: NSView.frameDidChangeNotification,
            object: self.collectionView
        )
    }

    func collectionView(_ collectionView: NSCollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return props.items.count
    }
    
    func collectionView(_ collectionView: NSCollectionView,
                        itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        guard let cell = collectionView.makeItem(withIdentifier: .listItem, for: indexPath) as? ListItem
            else {
                fatalError("\(#function) failed to create an instance of ListItem")
        }
        
        guard props.items.indices.contains(indexPath.item) else {
            fatalError("\(#function) item index out of bounds")
        }
        
        cell.props = props.items[indexPath.item]
        
        return cell
    }
   
    func collectionView(_ collectionView: NSCollectionView,
                        layout collectionViewLayout: NSCollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> NSSize {
        
        guard self.props.items.indices.contains(indexPath.item) else {
            fatalError("\(#function) item index out of bounds")
        }
        
        let props = self.props.items[indexPath.item]
        
        let proppertyListOffset = 16.0
        let propertyHeight = 17.0
        let propertyOffset = 8.0
        let proppertyListOffsetBottom = 19.0
        
        let propertyListHeight = props.fields.count > 0 ? CGFloat(proppertyListOffset + propertyHeight * Double(props.fields.count) + propertyOffset * Double(props.fields.count - 1) + proppertyListOffsetBottom) : 0
        return NSSize(width: collectionView.frame.width - (ItemsListViewFlowLayout.leftInset + ItemsListViewFlowLayout.rightInset), height: ItemsListViewFlowLayout.itemHeight + propertyListHeight)
    }
}
