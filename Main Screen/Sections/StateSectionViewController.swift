// Redux Visual Editor
// Created 29/01/2019 by Max Gribov
//

import Cocoa

class StateSectionViewController: NSViewController {

    @IBOutlet weak var headerView: ColorView!
    @IBOutlet weak var addButton: NSButton!
    @IBOutlet weak var collectionView: NSCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView.backgroundColor = NSColor(named: .headerBackground)
    }
    
    @IBAction func addButtonDidClicked(_ sender: NSButton) {
        
        //TODO: handle add button click here
    }
}

//MARK - NSCollectionViewDataSource

extension StateSectionViewController: NSCollectionViewDataSource {
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        return NSCollectionViewItem()
    }
}

//MARK - NSCollectionViewDelegate

extension StateSectionViewController: NSCollectionViewDelegate {
    
}
