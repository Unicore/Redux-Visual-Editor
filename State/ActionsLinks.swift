//
//  ActionsLinks.swift
//  ReduxVisualEditor


import Unicore

struct ActionsLinks: State {
    let links: [ActionName: [StateName]]
    
    static let initial = ActionsLinks(links: [:])
}

func reduce(_ old: ActionsLinks, with action: Action) -> ActionsLinks {
    return old
}
