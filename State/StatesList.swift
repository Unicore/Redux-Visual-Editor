struct StatesList {
    let states: [State]
    
    struct State: RawRepresentable, Equatable, Hashable {
        var rawValue: String
    }
    
    static let initial = StatesList(states: [])
}

func reduce(_ old: StatesList, with action: Action) -> StatesList {
    switch action {
        
    case let payload as AddState:
        if old.states.contains(where: { $0.rawValue == payload.name }) {
            // TODO: Error handling
            return old
        }

        return StatesList(states: old.states + [StatesList.State(rawValue: payload.name)])
        
    case let payload as DeleteState:
        var newList = old.states
        newList.removeAll { $0.rawValue == payload.name }
        return StatesList(states: newList)
        
    default:
        return old
    }
}
