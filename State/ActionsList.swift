struct ActionsList {
    let actions: [Action]
    
    struct Action: RawRepresentable, Equatable, Hashable {
        var rawValue: String
    }
    
    static let initial = ActionsList(actions: [])
}

func reduce(_ old: ActionsList, with action: Action) -> ActionsList {
    switch action {
        
    case let payload as AddAction:
        if old.actions.contains(where: { $0.rawValue == payload.name }) {
            // TODO: Error handling
            return old
        }
        
        return ActionsList(actions: old.actions + [ActionsList.Action(rawValue: payload.name)])
        
    case let payload as DeleteAction:
        var newList = old.actions
        newList.removeAll { $0.rawValue == payload.name }
        return ActionsList(actions: newList)
        
    default:
        return old
    }}

