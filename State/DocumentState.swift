//
//  DocumentState.swift
//  ReduxVisualEditor


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
