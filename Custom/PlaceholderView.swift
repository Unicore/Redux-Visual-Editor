// Redux Visual Editor
// Created on 06/02/2019 by Max Gribov
//

import Cocoa

class PlaceholderView: NSView {

    init() {
        super.init(frame: NSRect.zero)
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
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
