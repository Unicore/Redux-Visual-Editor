//
//  ThemeRelatedViewController.swift
//  ReduxVisualEditor
//
//  Created by Max Gribov on 29/01/2019.
//  Copyright © 2019 Unicore. All rights reserved.
//

import Cocoa

class ThemeRelatedViewController: NSViewController {
    
    var appearanceChangeObservation: NSKeyValueObservation?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        appearanceChangeObservation = view.observe(\.effectiveAppearance, changeHandler: { [weak self] (_, _) in
            self?.updateAppearance()
        })
    }
    
    @objc func updateAppearance()  {
        //implement in subclass
    }
    
    deinit {
        appearanceChangeObservation = nil
    }
}
