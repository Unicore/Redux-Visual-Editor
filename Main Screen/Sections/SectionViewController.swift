//
//  SectionViewController.swift
//  ReduxVisualEditor
//
//  Created by Max Gribov on 29/01/2019.
//  Copyright © 2019 Unicore. All rights reserved.
//

import Cocoa

class SectionViewController: NSViewController {

    @IBOutlet weak var headerView: ColorView!
    @IBOutlet weak var addButton: NSButton!
    @IBOutlet weak var collectionView: NSCollectionView!

    enum Section: Int {
        case actions
        case state
        case props
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        headerView.backgroundColor = NSColor(named: .headerBackground)
        registeItems()
    }
}

//MARK: - Sections Items

extension SectionViewController {
    
    func registeItems() {
        guard let nib = NSNib(nibNamed: .sectionItem, bundle: Bundle.main) else {
            return
        }
        collectionView.register(nib, forItemWithIdentifier: .sectionItem)
    }
}

extension NSUserInterfaceItemIdentifier {
    static let sectionItem = NSUserInterfaceItemIdentifier("Section Item")
}

extension NSNib.Name {
    static let sectionItem = NSNib.Name("SectionCollectionViewItem")
}

//MARK: - Controls

extension SectionViewController {
    
    func addButtonDidClicked(in section: SectionViewController.Section) {
        //TODO: remove after tests
        print("add button clicked in section: \(section)")
    }
}

//MARK - NSCollectionViewDataSource

extension SectionViewController: NSCollectionViewDataSource, NSCollectionViewDelegate {

    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        fatalError("requires the implementation in the subclass")
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        fatalError("requires the implementation in the subclass")
    }
}
