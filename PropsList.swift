//
//  PropsList.swift
//  ReduxVisualEditor
//
//  Created by Maxim Bazarov on 26.01.19.
//  Copyright © 2019 Unicore. All rights reserved.
//

import Unicore

extension Props {
    typealias Name = String
}

struct PropsList {
    let list: [Props.Name]
    
    static let initial = PropsList(list: [])
}

func reduce(_ old: PropsList, with action: Action) -> PropsList {
    return old
}

