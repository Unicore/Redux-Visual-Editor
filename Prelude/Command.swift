struct Command {
    private let action: () -> ()
    
    func run() {
        action()
    }
}
