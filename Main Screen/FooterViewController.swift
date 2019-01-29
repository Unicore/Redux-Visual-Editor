//
//  FooterViewController.swift
//  ReduxVisualEditor
//
//  Created by Max Gribov on 29/01/2019.
//  Copyright © 2019 Unicore. All rights reserved.
//

import Cocoa

class FooterViewController: ThemeRelatedViewController {

    @IBOutlet weak var searchField: NSSearchField!
    
    override func updateAppearance() {
        (view as? ColorView)?.backgroundColor = NSColor(named: "Footer Background")
    }
}

//MARK: - NSSearchFieldDelegate

extension FooterViewController: NSSearchFieldDelegate {
    
}
