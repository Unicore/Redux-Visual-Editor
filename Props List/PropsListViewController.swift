// Redux Visual Editor
// Created 29/01/2019 by Max Gribov
//

import Cocoa

class PropsListViewController: NSViewController {

    @IBOutlet weak var headerView: ColorView!
    @IBOutlet weak var addButton: NSButton!
    @IBOutlet weak var collectionView: NSCollectionView!

    @IBAction func addButtonDidClicked(_ sender: NSButton) {
        props.list.newEntry.activate.execute()
    }
    
    var props = Props.initial {
        didSet {
            guard isViewLoaded else { return }
            render()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView.backgroundColor = NSColor(named: .headerBackground)
        render()
    }
    
    private func render() {}
}

//MARK: - NSCollectionViewDataSource

extension PropsListViewController: NSCollectionViewDataSource {
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        return NSCollectionViewItem()
    }
}

//MARK: - NSCollectionViewDelegate

extension PropsListViewController: NSCollectionViewDelegate {
    
}
