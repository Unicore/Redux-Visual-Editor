// Redux Visual Editor
// Created on 25.01.19 by Maxim Bazarov
//

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
        if old.states.contains(payload.state) {
            // TODO: Error handling
            return old
        }

        return StatesList(states: old.states + [payload.state])
        
    case let payload as DeleteState:
        var newList = old.states
        newList.removeAll { $0 == payload.state }
        return StatesList(states: newList)
        
    default:
        return old
    }
}
