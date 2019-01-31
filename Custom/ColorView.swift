// Redux Visual Editor
// Created 30/01/2019 by Max Gribov
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
