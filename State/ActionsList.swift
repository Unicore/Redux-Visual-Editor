// Redux Visual Editor
// Created on 25.01.19 by Maxim Bazarov
//

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
        if old.actions.contains(payload.action) {
            // TODO: Error handling
            return old
        }
        
        return ActionsList(actions: old.actions + [payload.action])
        
    case let payload as DeleteAction:
        var newList = old.actions
        newList.removeAll { $0 == payload.action }
        return ActionsList(actions: newList)
        
    default:
        return old
    }}

