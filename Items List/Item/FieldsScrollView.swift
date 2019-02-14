// Redux Visual Editor
// Created on 14/02/2019 by Max Gribov
//

import Cocoa

class FieldsScrollView: NSScrollView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        horizontalScroller = nil
        verticalScroller = nil
    }

    override func scrollWheel(with event: NSEvent) {
        nextResponder?.scrollWheel(with: event)
    }
}
