// Redux Visual Editor
// Created 30/01/2019 by Max Gribov
//

import Cocoa

class SectionItemBackgroundView: NSView {
    
    var type: SectionCollectionViewItem.Section = .actions
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        guard let fillColor =  NSColor(named: .sectionItemFill), let strokeColor = NSColor(named: .sectionItemStroke) else {
            return
        }
        switch effectiveAppearance.bestMatch(from: [.aqua, .darkAqua]) {
        case .darkAqua?:
            MacStyleKit.drawCell(
                frame: bounds,
                fillColor: fillColor,
                strokeColor: strokeColor,
                shadow: MacStyleKit.shadowDark,
                type: CGFloat(type.rawValue)
            )
        default:
            MacStyleKit.drawCell(frame: bounds,
                                 fillColor: fillColor,
                                 strokeColor: strokeColor,
                                 shadow: MacStyleKit.shadowLight,
                                 type: CGFloat(type.rawValue))
        }
    }
}
