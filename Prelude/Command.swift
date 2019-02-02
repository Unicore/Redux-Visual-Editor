// Redux Visual Editor
// Created on 26.01.19 by Alexey Demedetskiy
//

import Foundation

public
class Command<T> {
    
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
    static var nop: Command { return Command(id: "nop") { _ in } }
    
    /// Support for Xcode quick look feature.
    @objc
    public
    func debugQuickLookObject() -> AnyObject? {
        return debugDescription as NSString
    }
}

extension Command: CustomDebugStringConvertible {
    
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
typealias PlainCommand = Command<Void>

public
extension Command where T == Void {
    func execute() {
        execute(with: ())
    }
}

/// Allows PlainCommands to be compared and stored in sets and dicts.
/// Uses `ObjectIdentifier` to distinguish between PlainCommands
extension Command: Hashable {
    public static
        func ==(left: Command, right: Command) -> Bool {
        return ObjectIdentifier(left) == ObjectIdentifier(right)
    }
    
    public
    var hashValue: Int { return ObjectIdentifier(self).hashValue }
}

// MARK: - Value binding
public
extension Command {
    /// Creates new plain command with value inside
    ///
    /// - Parameter value: Value to be bound
    /// - Returns: PlainCommand with having `value` when executed
    public
    func bound(to value: T) -> PlainCommand {
        return PlainCommand { self.execute(with: value) }
    }
}

// MARK: Map
extension Command {
    
    func map<U>(transform: @escaping (U) -> T) -> Command<U> {
        return Command<U> { value in self.execute(with: transform(value)) }
    }
}

// MARK: Queueing
public
extension Command {
    
    public
    func async(on queue: DispatchQueue) -> Command {
        return Command { value in
            queue.async {
                self.execute(with: value)
            }
        }
    }
}
