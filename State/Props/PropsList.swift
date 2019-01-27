struct PropsList {
    let props: [Props]
    
    struct Props: RawRepresentable, Equatable, Hashable {
        var rawValue: String
    }
    
    static let initial = PropsList(props: [])
}

func reduce(_ old: PropsList, with action: Action) -> PropsList {
    switch action {
    
    case let payload as AddProps:
        return PropsList(props: old.props + [PropsList.Props(rawValue: payload.name)])

    case let payload as DeleteProps:
        var newList = old.props
        newList.removeAll { $0.rawValue == payload.name }
        return PropsList(props: newList)

    default:
        return old
    }
}

