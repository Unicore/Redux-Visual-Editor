// Redux Visual Editor
// Created 29/01/2019 by Max Gribov
//

import Cocoa

class ActionsListViewController: NSViewController {
    
    @IBOutlet weak var headerView: ColorView!
    @IBOutlet weak var addButton: NSButton!
    @IBOutlet weak var collectionView: NSCollectionView!

    @IBAction func addButtonDidClicked(_ sender: NSButton) {}

    var props = Props.initial {
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

    private func render() {}
}

//MARK: - Sections Items

extension ActionsListViewController {
    
    func registeItems() {
        guard let nib = NSNib(nibNamed: .sectionItem, bundle: Bundle.main) else {
            return
        }
        collectionView.register(nib, forItemWithIdentifier: .sectionItem)
    }
}

//MARK: - NSCollectionViewDataSource

extension ActionsListViewController: NSCollectionViewDataSource {
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
   func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let cell = collectionView.makeItem(withIdentifier: .sectionItem, for: indexPath)
        return cell
    }
}

//MARK: - NSCollectionViewDelegate

extension ActionsListViewController: NSCollectionViewDelegate {
    
}
