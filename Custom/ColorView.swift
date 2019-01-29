//
//  ColorView.swift
//  ReduxVisualEditor
//
//  Created by Max Gribov on 30/01/2019.
//  Copyright © 2019 Unicore. All rights reserved.
//

import Cocoa

class ColorView: NSView {
    
    var backgroundColor: NSColor?

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        guard let backgroundColor = backgroundColor else {
            return
        }
        backgroundColor.setFill()
        dirtyRect.fill()
    }
}
