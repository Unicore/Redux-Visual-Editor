//
//  PropsLinks.swift
//  ReduxVisualEditor
//
//  Created by Maxim Bazarov on 26.01.19.
//  Copyright © 2019 Unicore. All rights reserved.
//

import Unicore

struct StatesLinks: State {
    let links: [State.Name: [Props.Name]]
    
    static let initial = StatesLinks(links: [:])
}

func reduce(_ old: StatesLinks, with action: Action) -> StatesLinks {
    return old
}


