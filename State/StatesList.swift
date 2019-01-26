//
//  StatesList.swift
//  ReduxVisualEditor


import Unicore

typealias StateName = String

struct StatesList: State {
    let list: [StateName]
    
    static let initial = StatesList(list: [])
}

func reduce(_ old: StatesList, with action: Action) -> StatesList {
    return old
}
