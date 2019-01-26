//
//  StatesFields.swift
//  ReduxVisualEditor
//
//  Created by Maxim Bazarov on 26.01.19.
//  Copyright © 2019 Unicore. All rights reserved.
//

import Unicore

struct StatesFields {
    let fields: [State.Name]
    
    static let initial = StatesFields(fields: [])
}

func reduce(_ old: StatesFields, with action: Action) -> StatesFields {
    return old
}
