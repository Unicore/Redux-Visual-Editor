//
//  StatesList.swift
//  ReduxVisualEditor
//
//  Created by Maxim Bazarov on 26.01.19.
//  Copyright © 2019 Unicore. All rights reserved.
//

import Unicore

extension State {
    typealias Name = String
}

struct StatesList {
    let list: [State.Name]
    
    static let initial = StatesList(list: [])
}

func reduce(_ old: StatesList, with action: Action) -> StatesList {
    return old
}
