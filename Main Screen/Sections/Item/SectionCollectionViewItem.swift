//
//  SectionCollectionViewItem.swift
//  ReduxVisualEditor
//
//  Created by Max Gribov on 30/01/2019.
//  Copyright © 2019 Unicore. All rights reserved.
//

import Cocoa

class SectionCollectionViewItem: NSCollectionViewItem {

    @IBOutlet weak var backgroundView: SectionItemBackgroundView!
    @IBOutlet weak var nameLabel: NSTextField!
    @IBOutlet weak var addButton: NSButton!
    @IBOutlet weak var propertiesStackView: NSStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addButtonDidCicked(_ sender: NSButton) {
        
        
    }
}
