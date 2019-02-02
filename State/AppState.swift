// Redux Visual Editor
// Created on 25.01.19 by Maxim Bazarov
//

struct AppState {
    let states: StatesList
    let actions: ActionsList
    let props: PropsList
    
    let actionsLinks: ActionsLinks
    let statesLinks: StatesLinks
    
    let actionsFields: ActionsFields
    let propsFields: PropsFields
    let statesFields: StatesFields
    
    static let initial = AppState(
        states: StatesList.initial,
        actions: ActionsList.initial,
        props: PropsList.initial,
        actionsLinks: ActionsLinks.initial,
        statesLinks: StatesLinks.initial,
        actionsFields: ActionsFields.initial,
        propsFields: PropsFields.initial,
        statesFields: StatesFields.initial
    )
}

func reduce(_ old: AppState, with action: Action) -> AppState {
    return AppState(
        states: reduce(old.states, with: action),
        actions: reduce(old.actions, with: action),
        props: reduce(old.props, with: action),
        actionsLinks: reduce(old.actionsLinks, with: action),
        statesLinks: reduce(old.statesLinks, with: action),
        actionsFields: reduce(old.actionsFields, with: action),
        propsFields: reduce(old.propsFields, with: action),
        statesFields: reduce(old.statesFields, with: action)
    )
}
