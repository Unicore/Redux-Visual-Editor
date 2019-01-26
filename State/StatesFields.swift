//
//  StatesFields.swift
//  ReduxVisualEditor


import Unicore

struct StatesFields: State {
    let fields: [StateName]
    
    static let initial = StatesFields(fields: [])
}

func reduce(_ old: StatesFields, with action: Action) -> StatesFields {
    return old
}
