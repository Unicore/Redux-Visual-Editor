//
//  FooterViewController.swift
//  ReduxVisualEditor
//
//  Created by Max Gribov on 29/01/2019.
//  Copyright © 2019 Unicore. All rights reserved.
//

import Cocoa

class FooterViewController: NSViewController {

    @IBOutlet weak var searchField: NSSearchField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (view as? ColorView)?.backgroundColor = NSColor(named: .footerBackground)
    }
}

//MARK: - NSSearchFieldDelegate

extension FooterViewController: NSSearchFieldDelegate {
    
}
