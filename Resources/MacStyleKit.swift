// Redux Visual Editor
// Created on 30/01/2019 by Max Gribov
//


import Cocoa

public class MacStyleKit : NSObject {

    //// Cache

    private struct Cache {
        static let shadowTintLight: NSColor = NSColor(red: 0.22, green: 0.385, blue: 0.445, alpha: 1)
        static let shadowTintDark: NSColor = NSColor(red: 0, green: 0, blue: 0, alpha: 1)
        static let shadowLight: NSShadow = NSShadow(color: MacStyleKit.shadowTintLight.withAlphaComponent(0.45 * MacStyleKit.shadowTintLight.alphaComponent), offset: NSSize(width: 1, height: -1), blurRadius: 4)
        static let shadowDark: NSShadow = NSShadow(color: MacStyleKit.shadowTintDark.withAlphaComponent(0.84 * MacStyleKit.shadowTintDark.alphaComponent), offset: NSSize(width: 1, height: -1), blurRadius: 4)
    }

    //// Colors

    @objc dynamic public class var shadowTintLight: NSColor { return Cache.shadowTintLight }
    @objc dynamic public class var shadowTintDark: NSColor { return Cache.shadowTintDark }

    //// Shadows

    @objc dynamic public class var shadowLight: NSShadow { return Cache.shadowLight }
    @objc dynamic public class var shadowDark: NSShadow { return Cache.shadowDark }

    //// Drawing Methods

    @objc dynamic public class func drawPreview(frame targetFrame: NSRect = NSRect(x: 0, y: 0, width: 390, height: 348), resizing: ResizingBehavior = .aspectFit, fillColor: NSColor = NSColor(red: 1, green: 1, blue: 1, alpha: 1), strokeColor: NSColor = NSColor(red: 0.538, green: 0.549, blue: 0.56, alpha: 1)) {
        //// General Declarations
        let context = NSGraphicsContext.current!.cgContext
        
        //// Resize to Target Frame
        NSGraphicsContext.saveGraphicsState()
        let resizedFrame: NSRect = resizing.apply(rect: NSRect(x: 0, y: 0, width: 390, height: 348), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 390, y: resizedFrame.height / 348)

        //// Symbol 3 Drawing
        let symbol3Rect = NSRect(x: 11, y: 24, width: 363, height: 139)
        NSGraphicsContext.saveGraphicsState()
        symbol3Rect.clip()
        context.translateBy(x: symbol3Rect.minX, y: symbol3Rect.minY)

        MacStyleKit.drawCell(frame: NSRect(x: 0, y: 0, width: symbol3Rect.width, height: symbol3Rect.height), fillColor: fillColor, strokeColor: strokeColor, shadow: MacStyleKit.shadowLight, type: 0)
        NSGraphicsContext.restoreGraphicsState()


        //// Symbol Drawing
        let symbolRect = NSRect(x: 14, y: 236, width: 112, height: 100)
        NSGraphicsContext.saveGraphicsState()
        symbolRect.clip()
        context.translateBy(x: symbolRect.minX, y: symbolRect.minY)

        MacStyleKit.drawCell(frame: NSRect(x: 0, y: 0, width: symbolRect.width, height: symbolRect.height), fillColor: fillColor, strokeColor: strokeColor, shadow: MacStyleKit.shadowLight, type: 0)
        NSGraphicsContext.restoreGraphicsState()


        //// Symbol 2 Drawing
        let symbol2Rect = NSRect(x: 139, y: 276, width: 235, height: 60)
        NSGraphicsContext.saveGraphicsState()
        symbol2Rect.clip()
        context.translateBy(x: symbol2Rect.minX, y: symbol2Rect.minY)

        MacStyleKit.drawCell(frame: NSRect(x: 0, y: 0, width: symbol2Rect.width, height: symbol2Rect.height), fillColor: fillColor, strokeColor: strokeColor, shadow: MacStyleKit.shadowLight, type: 1)
        NSGraphicsContext.restoreGraphicsState()


        //// Symbol 4 Drawing
        let symbol4Rect = NSRect(x: 14, y: 170, width: 360, height: 60)
        NSGraphicsContext.saveGraphicsState()
        symbol4Rect.clip()
        context.translateBy(x: symbol4Rect.minX, y: symbol4Rect.minY)

        MacStyleKit.drawCell(frame: NSRect(x: 0, y: 0, width: symbol4Rect.width, height: symbol4Rect.height), fillColor: fillColor, strokeColor: strokeColor, shadow: MacStyleKit.shadowLight, type: 0)
        NSGraphicsContext.restoreGraphicsState()
        
        NSGraphicsContext.restoreGraphicsState()

    }

    @objc dynamic public class func drawCell(frame: NSRect = NSRect(x: 0, y: 0, width: 360, height: 60), fillColor: NSColor = NSColor(red: 1, green: 1, blue: 1, alpha: 1), strokeColor: NSColor = NSColor(red: 0.538, green: 0.549, blue: 0.56, alpha: 1), shadow: NSShadow, type: CGFloat = 0) {

        //// Variable Declarations
        let leftPlug: Bool = type == 0
        let rightPlug: Bool = type == 2


        //// Subframes
        let leftHoleFrame = NSRect(x: frame.minX + 13, y: frame.minY + frame.height - 37.5, width: 15, height: 15)
        let rightHoleFrame = NSRect(x: frame.minX + frame.width - 29, y: frame.minY + frame.height - 37.5, width: 15, height: 15)


        //// Bezier Drawing
        let bezierPath = NSBezierPath()
        bezierPath.move(to: NSPoint(x: rightHoleFrame.minX + 7.05, y: rightHoleFrame.maxY - 4.1))
        bezierPath.curve(to: NSPoint(x: rightHoleFrame.minX + 3.56, y: rightHoleFrame.maxY - 7.53), controlPoint1: NSPoint(x: rightHoleFrame.minX + 5.12, y: rightHoleFrame.maxY - 4.1), controlPoint2: NSPoint(x: rightHoleFrame.minX + 3.56, y: rightHoleFrame.maxY - 5.63))
        bezierPath.curve(to: NSPoint(x: rightHoleFrame.minX + 3.63, y: rightHoleFrame.maxY - 8.22), controlPoint1: NSPoint(x: rightHoleFrame.minX + 3.56, y: rightHoleFrame.maxY - 7.76), controlPoint2: NSPoint(x: rightHoleFrame.minX + 3.58, y: rightHoleFrame.maxY - 7.99))
        bezierPath.curve(to: NSPoint(x: rightHoleFrame.minX + 7.05, y: rightHoleFrame.maxY - 10.96), controlPoint1: NSPoint(x: rightHoleFrame.minX + 3.95, y: rightHoleFrame.maxY - 9.78), controlPoint2: NSPoint(x: rightHoleFrame.minX + 5.36, y: rightHoleFrame.maxY - 10.96))
        bezierPath.curve(to: NSPoint(x: rightHoleFrame.minX + 10.54, y: rightHoleFrame.maxY - 7.53), controlPoint1: NSPoint(x: rightHoleFrame.minX + 8.97, y: rightHoleFrame.maxY - 10.96), controlPoint2: NSPoint(x: rightHoleFrame.minX + 10.54, y: rightHoleFrame.maxY - 9.42))
        bezierPath.curve(to: NSPoint(x: rightHoleFrame.minX + 7.05, y: rightHoleFrame.maxY - 4.1), controlPoint1: NSPoint(x: rightHoleFrame.minX + 10.54, y: rightHoleFrame.maxY - 5.63), controlPoint2: NSPoint(x: rightHoleFrame.minX + 8.97, y: rightHoleFrame.maxY - 4.1))
        bezierPath.close()
        bezierPath.move(to: NSPoint(x: leftHoleFrame.minX + 7.95, y: leftHoleFrame.maxY - 4.1))
        bezierPath.curve(to: NSPoint(x: leftHoleFrame.minX + 4.46, y: leftHoleFrame.maxY - 7.53), controlPoint1: NSPoint(x: leftHoleFrame.minX + 6.03, y: leftHoleFrame.maxY - 4.1), controlPoint2: NSPoint(x: leftHoleFrame.minX + 4.46, y: leftHoleFrame.maxY - 5.63))
        bezierPath.curve(to: NSPoint(x: leftHoleFrame.minX + 4.88, y: leftHoleFrame.maxY - 9.16), controlPoint1: NSPoint(x: leftHoleFrame.minX + 4.46, y: leftHoleFrame.maxY - 8.12), controlPoint2: NSPoint(x: leftHoleFrame.minX + 4.62, y: leftHoleFrame.maxY - 8.67))
        bezierPath.curve(to: NSPoint(x: leftHoleFrame.minX + 7.95, y: leftHoleFrame.maxY - 10.96), controlPoint1: NSPoint(x: leftHoleFrame.minX + 5.47, y: leftHoleFrame.maxY - 10.23), controlPoint2: NSPoint(x: leftHoleFrame.minX + 6.63, y: leftHoleFrame.maxY - 10.96))
        bezierPath.curve(to: NSPoint(x: leftHoleFrame.minX + 8.94, y: leftHoleFrame.maxY - 10.82), controlPoint1: NSPoint(x: leftHoleFrame.minX + 8.3, y: leftHoleFrame.maxY - 10.96), controlPoint2: NSPoint(x: leftHoleFrame.minX + 8.62, y: leftHoleFrame.maxY - 10.91))
        bezierPath.curve(to: NSPoint(x: leftHoleFrame.minX + 11.44, y: leftHoleFrame.maxY - 7.53), controlPoint1: NSPoint(x: leftHoleFrame.minX + 10.39, y: leftHoleFrame.maxY - 10.41), controlPoint2: NSPoint(x: leftHoleFrame.minX + 11.44, y: leftHoleFrame.maxY - 9.09))
        bezierPath.curve(to: NSPoint(x: leftHoleFrame.minX + 7.95, y: leftHoleFrame.maxY - 4.1), controlPoint1: NSPoint(x: leftHoleFrame.minX + 11.44, y: leftHoleFrame.maxY - 5.63), controlPoint2: NSPoint(x: leftHoleFrame.minX + 9.88, y: leftHoleFrame.maxY - 4.1))
        bezierPath.close()
        bezierPath.move(to: NSPoint(x: frame.maxX - 5, y: frame.maxY - 12.84))
        bezierPath.line(to: NSPoint(x: frame.maxX - 5, y: frame.minY + 12.84))
        bezierPath.curve(to: NSPoint(x: frame.maxX - 12.98, y: frame.minY + 5), controlPoint1: NSPoint(x: frame.maxX - 5, y: frame.minY + 8.51), controlPoint2: NSPoint(x: frame.maxX - 8.57, y: frame.minY + 5))
        bezierPath.line(to: NSPoint(x: frame.minX + 12.98, y: frame.minY + 5))
        bezierPath.curve(to: NSPoint(x: frame.minX + 6.59, y: frame.minY + 8.15), controlPoint1: NSPoint(x: frame.minX + 10.36, y: frame.minY + 5), controlPoint2: NSPoint(x: frame.minX + 8.04, y: frame.minY + 6.24))
        bezierPath.curve(to: NSPoint(x: frame.minX + 5, y: frame.minY + 12.84), controlPoint1: NSPoint(x: frame.minX + 5.59, y: frame.minY + 9.46), controlPoint2: NSPoint(x: frame.minX + 5, y: frame.minY + 11.08))
        bezierPath.line(to: NSPoint(x: frame.minX + 5, y: frame.maxY - 12.84))
        bezierPath.curve(to: NSPoint(x: frame.minX + 12.98, y: frame.maxY - 5), controlPoint1: NSPoint(x: frame.minX + 5, y: frame.maxY - 8.51), controlPoint2: NSPoint(x: frame.minX + 8.57, y: frame.maxY - 5))
        bezierPath.line(to: NSPoint(x: frame.maxX - 12.98, y: frame.maxY - 5))
        bezierPath.curve(to: NSPoint(x: frame.maxX - 5, y: frame.maxY - 12.84), controlPoint1: NSPoint(x: frame.maxX - 8.57, y: frame.maxY - 5), controlPoint2: NSPoint(x: frame.maxX - 5, y: frame.maxY - 8.51))
        bezierPath.close()
        NSGraphicsContext.saveGraphicsState()
        shadow.set()
        fillColor.setFill()
        bezierPath.fill()
        NSGraphicsContext.restoreGraphicsState()

        strokeColor.setStroke()
        bezierPath.lineWidth = 1
        bezierPath.stroke()


        //// Separator Drawing
        let separatorPath = NSBezierPath()
        separatorPath.move(to: NSPoint(x: frame.minX + 30, y: frame.maxY - 55))
        separatorPath.line(to: NSPoint(x: frame.maxX - 30, y: frame.maxY - 55))
        strokeColor.setStroke()
        separatorPath.lineWidth = 0.5
        separatorPath.lineCapStyle = .square
        separatorPath.stroke()


        if (rightPlug) {
            //// Right Hole Plug Drawing
            let rightHolePlugPath = NSBezierPath(ovalIn: NSRect(x: rightHoleFrame.minX + rightHoleFrame.width - 12, y: rightHoleFrame.minY + rightHoleFrame.height - 12, width: 9, height: 9))
            fillColor.setFill()
            rightHolePlugPath.fill()
        }


        if (leftPlug) {
            //// Left Hole Plug Drawing
            let leftHolePlugPath = NSBezierPath(ovalIn: NSRect(x: leftHoleFrame.minX + leftHoleFrame.width - 12, y: leftHoleFrame.minY + leftHoleFrame.height - 12, width: 9, height: 9))
            fillColor.setFill()
            leftHolePlugPath.fill()
        }
    }




    @objc(MacStyleKitResizingBehavior)
    public enum ResizingBehavior: Int {
        case aspectFit /// The content is proportionally resized to fit into the target rectangle.
        case aspectFill /// The content is proportionally resized to completely fill the target rectangle.
        case stretch /// The content is stretched to match the entire target rectangle.
        case center /// The content is centered in the target rectangle, but it is NOT resized.

        public func apply(rect: NSRect, target: NSRect) -> NSRect {
            if rect == target || target == NSRect.zero {
                return rect
            }

            var scales = NSSize.zero
            scales.width = abs(target.width / rect.width)
            scales.height = abs(target.height / rect.height)

            switch self {
                case .aspectFit:
                    scales.width = min(scales.width, scales.height)
                    scales.height = scales.width
                case .aspectFill:
                    scales.width = max(scales.width, scales.height)
                    scales.height = scales.width
                case .stretch:
                    break
                case .center:
                    scales.width = 1
                    scales.height = 1
            }

            var result = rect.standardized
            result.size.width *= scales.width
            result.size.height *= scales.height
            result.origin.x = target.minX + (target.width - result.width) / 2
            result.origin.y = target.minY + (target.height - result.height) / 2
            return result
        }
    }
}



private extension NSShadow {
    convenience init(color: NSColor!, offset: NSSize, blurRadius: CGFloat) {
        self.init()
        self.shadowColor = color
        self.shadowOffset = offset
        self.shadowBlurRadius = blurRadius
    }
}
