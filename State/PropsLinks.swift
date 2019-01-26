//
//  PropsLinks.swift
//  ReduxVisualEditor


import Unicore

struct StatesLinks: State {
    let links: [StateName: [PropsName]]
    
    static let initial = StatesLinks(links: [:])
}

func reduce(_ old: StatesLinks, with action: Action) -> StatesLinks {
    return old
}


