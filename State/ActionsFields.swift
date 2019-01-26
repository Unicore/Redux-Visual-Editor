//
//  ActionsFields.swift
//  ReduxVisualEditor
//
//  Created by Maxim Bazarov on 26.01.19.
//  Copyright © 2019 Unicore. All rights reserved.
//

import Unicore

struct ActionsFields: State {
    let fields: [Action.Name: [Field]]
    
    static let initial = ActionsFields(fields: [:])
}

func reduce(_ old: ActionsFields, with action: Action) -> ActionsFields {
    return old
}

