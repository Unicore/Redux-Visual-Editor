//
//  ActionsLinks.swift
//  ReduxVisualEditor
//
//  Created by Maxim Bazarov on 26.01.19.
//  Copyright © 2019 Unicore. All rights reserved.
//

import Unicore

struct ActionsLinks {
    let links: [Action.Name: [State.Name]]
    
    static let initial = ActionsLinks(links: [:])
}

func reduce(_ old: ActionsLinks, with action: Action) -> ActionsLinks {
    return old
}
