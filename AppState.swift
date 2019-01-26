//
//  AppState.swift
//  ReduxVisualEditor
//
//  Created by Maxim Bazarov on 26.01.19.
//  Copyright © 2019 Unicore. All rights reserved.
//

import Unicore

struct Field {
    let name: String
    let type: String
}

struct AppState {
    
    
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
