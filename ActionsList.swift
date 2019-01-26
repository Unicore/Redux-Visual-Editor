//
//  ActionsList.swift
//  ReduxVisualEditor
//
//  Created by Maxim Bazarov on 26.01.19.
//  Copyright © 2019 Unicore. All rights reserved.
//

import Unicore

extension Action {
    typealias Name = String
}

struct ActionsList {
    
    let list: [Action.Name]
    
    static let initial = ActionsList(list: [])
}

func reduce(_ old: ActionsList, with action: Action) -> ActionsList {
    return old
}

