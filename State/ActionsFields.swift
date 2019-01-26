//
//  ActionsFields.swift
//  ReduxVisualEditor


import Unicore

struct ActionsFields: State {
    let fields: [ActionName: [Field]]
    
    static let initial = ActionsFields(fields: [:])
}

func reduce(_ old: ActionsFields, with action: Action) -> ActionsFields {
    return old
}

