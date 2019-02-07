// Redux Visual Editor
// Created on 26.01.19 by Alexey Demedetskiy
//

import Foundation

public
class CommandOf<T> {
    
    let action: (T) -> () // underlying closure
    
    // Block of `context` defined variables. Allows Command to be debugged
    private let file: StaticString
    private let function: StaticString
    private let line: Int
    private let id: String
    
    public
    init(id: String = "unnamed",
         file: StaticString = #file,
         function: StaticString = #function,
         line: Int = #line,
         action: @escaping (T) -> ()) {
        self.id = id
        self.action = action
        self.function = function
        self.file = file
        self.line = line
    }
    
    public
    func execute(with value: T) {
        action(value)
    }
    
    /// Placeholder for do nothing PlainCommand
    public
    static var nop: CommandOf { return CommandOf(id: "nop") { _ in } }
    
    /// Support for Xcode quick look feature.
    @objc
    public
    func debugQuickLookObject() -> AnyObject? {
        return debugDescription as NSString
    }
}

extension CommandOf: CustomDebugStringConvertible {
    
    public var debugDescription: String {
        return """
        \(String(describing: type(of: self))) id: \(id)
        \tfile: \(file)
        \tfunction: \(function)
        \tline: \(line)
        """
    }
    
}


// MARK: - Plain (void typed) command
public
typealias Command = CommandOf<Void>

public
extension CommandOf where T == Void {
    func execute() {
        execute(with: ())
    }
}

/// Allows PlainCommands to be compared and stored in sets and dicts.
/// Uses `ObjectIdentifier` to distinguish between PlainCommands
extension CommandOf: Hashable {
    public static
        func ==(left: CommandOf, right: CommandOf) -> Bool {
        return ObjectIdentifier(left) == ObjectIdentifier(right)
    }
    
    public
    var hashValue: Int { return ObjectIdentifier(self).hashValue }
}

// MARK: - Value binding
public
extension CommandOf {
    /// Creates new plain command with value inside
    ///
    /// - Parameter value: Value to be bound
    /// - Returns: PlainCommand with having `value` when executed
    public
    func bound(to value: T) -> Command {
        return Command { self.execute(with: value) }
    }
}

// MARK: Map
extension CommandOf {
    
    func map<U>(transform: @escaping (U) -> T) -> CommandOf<U> {
        return CommandOf<U> { value in self.execute(with: transform(value)) }
    }
}

// MARK: Queueing
public
extension CommandOf {
    
    public
    func async(on queue: DispatchQueue) -> CommandOf {
        return CommandOf { value in
            queue.async {
                self.execute(with: value)
            }
        }
    }
}
