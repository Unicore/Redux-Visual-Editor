//
//  DocumentState.swift
//  ReduxVisualEditor
//
//  Created by Maxim Bazarov on 26.01.19.
//  Copyright © 2019 Unicore. All rights reserved.
//

import Unicore

struct DocumentState: State {
    
    let status: Status; enum Status {
        case none
        case needsDownloading(url: URL)
        case needsReading(fileURL: URL)
        case inProgress
        case document(data: Data)
    }
    
    static let initial = DocumentState(status: .none)
}

func reduce(_ old: DocumentState, with action: Action) -> DocumentState {
    return old
}
