//
//  PropsFields.swift
//  ReduxVisualEditor
//
//  Created by Maxim Bazarov on 26.01.19.
//  Copyright © 2019 Unicore. All rights reserved.
//

import Unicore

struct PropsFields: State {
    let fields: [Props.Name: [Field]]
    
    static let initial = PropsFields(fields: [:])
}

func reduce(_ old: PropsFields, with action: Action) -> PropsFields {
    return old
}
