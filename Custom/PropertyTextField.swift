// Redux Visual Editor
// Created 04/02/2019 by Max Gribov
//

import Cocoa

class PropertyTextField: NSTextField {
    
    enum Mode {
        case label
        case field
    }
    
    var mode: Mode = .label {
        didSet{
            switch mode {
            case .label:
                isBezeled = false
                isEditable = false
                isSelectable = false
                drawsBackground = false
            case .field:
                isBezeled = true
                isEditable = true
                isSelectable = true
                drawsBackground = true
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mode = .label
    }
    
    //not sure if needed
//    override var acceptsFirstResponder: Bool {
//        switch mode {
//        case .label: return true
//        case .field: return false
//        }
//    }
    
    override func becomeFirstResponder() -> Bool {
        mode = .field
        return true
    }
    
    override func resignFirstResponder() -> Bool {
        mode = .label
        return true
    }
    
    override func mouseDown(with event: NSEvent) {
        event.window?.makeFirstResponder(self)
    }
}
