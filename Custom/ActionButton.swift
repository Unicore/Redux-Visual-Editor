// Redux Visual Editor
// Created on 06/02/2019 by Max Gribov
//

import Cocoa

class ActionButton: NSButton {

    enum Kind {
        case plus
        case minus
    }
    
    convenience init(of kind: Kind, target: Any?, action: Selector?) {
        self.init(image: ActionButton.icon(of: kind), target: target, action: action)
        setButtonType(.momentaryPushIn)
        isBordered = false
        imageScaling = .scaleNone
        addConstraint(NSLayoutConstraint(item: self,
                                         attribute: .width,
                                         relatedBy: .equal,
                                         toItem: nil,
                                         attribute: .notAnAttribute,
                                         multiplier: 1.0, constant: 10))
        addConstraint(NSLayoutConstraint(item: self,
                                         attribute: .height,
                                         relatedBy: .equal,
                                         toItem: nil,
                                         attribute: .notAnAttribute,
                                         multiplier: 1.0, constant: 17))
    }

    static func icon(of kind: Kind) -> NSImage {
        guard let icon = NSImage(named: ActionButton.iconName(of: kind)) else {
            return NSImage()
        }
        return icon
    }
    
    static func iconName(of kind: Kind) -> NSImage.Name {
        switch kind {
        case .plus: return .plusButtonIcon
        case .minus: return .minusButtonIcon
        }
    }
}

extension NSImage.Name {
    static let plusButtonIcon = NSImage.Name("btn_plus_icon")
    static let minusButtonIcon = NSImage.Name("btn_minus_icon")
}
