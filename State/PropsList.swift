// Redux Visual Editor
// Created on 25.01.19 by Maxim Bazarov
//

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
        if old.props.contains(payload.props) {
            // TODO: Error handling
            return old
        }

        return PropsList(props: old.props + [payload.props])

    case let payload as DeleteProps:
        var newList = old.props
        newList.removeAll { $0 == payload.props }
        return PropsList(props: newList)

    case let payload as RenameProps:
        // if new name already exists
        if old.props.contains(PropsList.Props(rawValue: payload.newName)) {
            // TODO: Error handling
            return old
        }
        
        let rename: (PropsList.Props) -> PropsList.Props = { old in
            return old == payload.props ? PropsList.Props(rawValue: payload.newName) : old
        }
        
        return PropsList(props: old.props.map(rename))
        
    default:
        return old
    }
}

