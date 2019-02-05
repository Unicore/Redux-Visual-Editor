// Redux Visual Editor
// Created on 01.02.19 by Maxim Bazarov
//

import Cocoa

class ItemsListViewController: NSViewController {

    @IBOutlet weak var headerView: ColorView!
    @IBOutlet weak var addButton: NSButton!
    @IBOutlet weak var collectionView: NSCollectionView!
    
    @IBAction func addButtonDidClicked(_ sender: NSButton) {
        props.newEntry.activate.execute()
    }

    var props = Props.showCase {
        didSet {
            guard isViewLoaded else { return }
            render()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = ItemsListViewFlowLayout()
        collectionView.postsFrameChangedNotifications = true
        NotificationCenter.default.addObserver(self, selector: #selector(collectionViewFrameDidChanged(_:)), name: NSView.frameDidChangeNotification, object: self.collectionView)
        headerView.backgroundColor = NSColor(named: .headerBackground)
        registerItems()
    }
    
    private func render() {
        collectionView.reloadData()
    }
    
    @objc func collectionViewFrameDidChanged(_ notification: Notification) {
        collectionView.collectionViewLayout?.invalidateLayout()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSView.frameDidChangeNotification, object: self.collectionView)
    }
}


//MARK: - Sections Items

extension ItemsListViewController {
    
    func registerItems() {
        guard let nib = NSNib(nibNamed: .listItem, bundle: Bundle.main) else {
            return
        }
        collectionView.register(nib, forItemWithIdentifier: .listItem)
    }
}

//MARK: - NSCollectionViewDataSource

extension ItemsListViewController: NSCollectionViewDataSource {
    
    private func item(for indexPath: IndexPath) -> ListItem.Props {
        let index = indexPath.item
        guard 0..<props.items.count ~= index else {
            fatalError("\(#function) item index out of bounds")
        }
        return props.items[index]
    }

    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return props.items.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        guard let cell = collectionView.makeItem(withIdentifier: .listItem, for: indexPath) as? ListItem
            else {
                fatalError("\(#function) failed to create an instance of ListItem")
        }
        let props = item(for: indexPath)
        cell.props = props
        return cell
    }
}

//MARK: - NSCollectionViewDelegate

extension ItemsListViewController: NSCollectionViewDelegate {

}

//MARK: - NSCollectionViewDelegateFlowLayout

extension ItemsListViewController: NSCollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
        let props = item(for: indexPath)
        let proppertyListOffset = 16.0
        let propertyHeight = 17.0
        let propertyOffset = 8.0
        let proppertyListOffsetBottom = 19.0
        let propertyListHeight = props.fields.count > 0 ? CGFloat(proppertyListOffset + propertyHeight * Double(props.fields.count) + propertyOffset * Double(props.fields.count - 1) + proppertyListOffsetBottom) : 0
        return NSSize(width: collectionView.frame.width - (ItemsListViewFlowLayout.leftInset + ItemsListViewFlowLayout.rightInset), height: ItemsListViewFlowLayout.itemHeight + propertyListHeight)
    }
}
