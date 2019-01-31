// Redux Visual Editor
// Created 29/01/2019 by Max Gribov
//

import Cocoa

class PropsSectionViewController: SectionViewController {

    @IBAction func addButtonDidClicked(_ sender: NSButton) {
        addButtonDidClicked(in: .props)
    }
}

//MARK - NSCollectionViewDataSource

extension PropsSectionViewController {
    
    override func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    override func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        return NSCollectionViewItem()
    }
}
