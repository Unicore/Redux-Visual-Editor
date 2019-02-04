// Redux Visual Editor
// Created 04/02/2019 by Max Gribov
//

import Cocoa

class PropertyTextField: NSTextField {

    func label()  {
        isBezeled = false
        isEditable = false
        isSelectable = false
        drawsBackground = false
    }
}
