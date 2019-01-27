struct PropsList {
    let props: [Props]
    
    struct Props: RawRepresentable, Equatable, Hashable {
        var rawValue: String
    }
    
    static let initial = PropsList(props: [])
}

func reduce(_ old: PropsList, with action: Action) -> PropsList {
    return old
}

