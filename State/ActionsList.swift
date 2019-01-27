struct ActionsList {
    let actions: [Action]
    
    struct Action: RawRepresentable, Equatable, Hashable {
        var rawValue: String
    }
    
    static let initial = ActionsList(actions: [])
}

func reduce(_ old: ActionsList, with action: Action) -> ActionsList {
    return old
}

