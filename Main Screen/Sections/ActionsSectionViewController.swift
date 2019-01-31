// Redux Visual Editor
// Created 29/01/2019 by Max Gribov
//

import Cocoa

class ActionsSectionViewController: SectionViewController {

    @IBAction func addButtonDidClicked(_ sender: NSButton) {
        addButtonDidClicked(in: .actions)
    }
}

//MARK - NSCollectionViewDataSource

extension ActionsSectionViewController {
    
    override func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    override func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let cell = collectionView.makeItem(withIdentifier: .sectionItem, for: indexPath)
        return cell
    }
}
