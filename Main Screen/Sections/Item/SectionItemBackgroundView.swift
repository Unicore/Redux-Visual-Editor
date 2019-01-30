//
//  SectionItemBackgroundView.swift
//  ReduxVisualEditor
//
//  Created by Max Gribov on 30/01/2019.
//  Copyright © 2019 Unicore. All rights reserved.
//

import Cocoa

class SectionItemBackgroundView: NSView {
    
    var type: SectionViewController.Section = .actions

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        guard let fillColor =  NSColor(named: .sectionItemFill), let strokeColor = NSColor(named: .sectionItemStroke) else {
            return
        }
        switch effectiveAppearance.bestMatch(from: [.aqua, .darkAqua]) {
        case .darkAqua?:
            MacStyleKit.drawCell(frame: bounds,
                                 fillColor: fillColor,
                                 strokeColor: strokeColor,
                                 shadow: MacStyleKit.shadowDark,
                                 type: CGFloat(type.rawValue))
        default:
            MacStyleKit.drawCell(frame: bounds,
                                 fillColor: fillColor,
                                 strokeColor: strokeColor,
                                 shadow: MacStyleKit.shadowLight,
                                 type: CGFloat(type.rawValue))
        }
    }
}
