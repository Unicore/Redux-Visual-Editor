//
//  ActionsList.swift
//  ReduxVisualEditor


import Unicore

typealias ActionName = String

struct ActionsList: State {
    
    let list: [ActionName]
    
    static let initial = ActionsList(list: [])
}

func reduce(_ old: ActionsList, with action: Action) -> ActionsList {
    return old
}

