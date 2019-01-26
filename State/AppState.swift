//
//  AppState.swift
//  ReduxVisualEditor


import Unicore

struct Field {
    let name: String
    let type: String
}

struct AppState {
    
    let document: DocumentState
    
    let states: StatesList
    let actions: ActionsList
    let props: PropsList
    
    let actionsLinks: ActionsLinks
    let statesLinks: StatesLinks
    
    let actionsFields: ActionsFields
    let propsFields: PropsFields
    let statesFields: StatesFields
    
    // MARK: Initial
    static let initial = AppState(
        document: DocumentState.initial,
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
        document: reduce(old.document, with: action),
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
