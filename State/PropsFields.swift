//
//  PropsFields.swift
//  ReduxVisualEditor


import Unicore

struct PropsFields: State {
    let fields: [PropsName: [Field]]
    
    static let initial = PropsFields(fields: [:])
}

func reduce(_ old: PropsFields, with action: Action) -> PropsFields {
    return old
}
