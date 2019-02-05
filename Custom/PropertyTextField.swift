// Redux Visual Editor
// Created 04/02/2019 by Max Gribov
//

import Cocoa

class PropertyTextField: NSTextField {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        labelStyle()
    }
    
    func labelStyle() {
        isEditable = true
        isSelectable = true
        isBezeled = false
        drawsBackground = false
    }
}
