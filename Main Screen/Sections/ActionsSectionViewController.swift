// Redux Visual Editor
// Created 29/01/2019 by Max Gribov
//

import Cocoa

class ActionsSectionViewController: NSViewController {
    
    @IBOutlet weak var headerView: ColorView!
    @IBOutlet weak var addButton: NSButton!
    @IBOutlet weak var collectionView: NSCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView.backgroundColor = NSColor(named: .headerBackground)
        registeItems()
    }

    @IBAction func addButtonDidClicked(_ sender: NSButton) {

        //TODO: handle add button click here
    }
}

//MARK: - Sections Items

extension ActionsSectionViewController {
    
    func registeItems() {
        guard let nib = NSNib(nibNamed: .sectionItem, bundle: Bundle.main) else {
            return
        }
        collectionView.register(nib, forItemWithIdentifier: .sectionItem)
    }
}

//MARK - NSCollectionViewDataSource

extension ActionsSectionViewController: NSCollectionViewDataSource {
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
   func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let cell = collectionView.makeItem(withIdentifier: .sectionItem, for: indexPath)
        return cell
    }
}

//MARK - NSCollectionViewDelegate

extension ActionsSectionViewController: NSCollectionViewDelegate {
    
}
