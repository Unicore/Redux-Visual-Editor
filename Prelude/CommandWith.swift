struct CommandWith<T> {
    private let action: (T) -> ()
    
    func run(with value: T) {
        action(value)
    }
}
