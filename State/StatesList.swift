struct StatesList {
    let states: [State]
    
    struct State: RawRepresentable, Equatable, Hashable {
        var rawValue: String
    }
    
    static let initial = StatesList(states: [])
}

func reduce(_ old: StatesList, with action: Action) -> StatesList {
    return old
}
