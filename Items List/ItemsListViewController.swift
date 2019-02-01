// Redux Visual Editor
// Created 01.02.19 by Maxim Bazarov
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
        headerView.backgroundColor = NSColor(named: .headerBackground)
        registeItems()
    }
    
    private func render() {
        collectionView.reloadData()
    }
}


//MARK: - Sections Items

extension ItemsListViewController {
    
    func registeItems() {
        guard let nib = NSNib(nibNamed: .sectionItem, bundle: Bundle.main) else {
            return
        }
        collectionView.register(nib, forItemWithIdentifier: .sectionItem)
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
        guard let cell = collectionView.makeItem(withIdentifier: .sectionItem, for: indexPath) as? ListItem
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
