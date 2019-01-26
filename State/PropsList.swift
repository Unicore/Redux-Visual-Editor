//
//  PropsList.swift
//  ReduxVisualEditor


import Unicore

typealias PropsName = String

struct PropsList: State {
    let list: [PropsName]
    
    static let initial = PropsList(list: [])
}

func reduce(_ old: PropsList, with action: Action) -> PropsList {
    return old
}

