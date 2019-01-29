//
//  ActionsSectionViewController.swift
//  ReduxVisualEditor
//
//  Created by Max Gribov on 29/01/2019.
//  Copyright © 2019 Unicore. All rights reserved.
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
        return 0
    }
    
    override func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        return NSCollectionViewItem()
    }
}
