// Redux Visual Editor
// Created 01.02.19 by Maxim Bazarov
//

extension ListItem {
    
    struct Props {
        let name: String
        let fields: [Field]
        
        let kind: Kind
        
        enum Kind {
            case action(connectOutput: PlainCommand?)
            case state(connectOutput: PlainCommand?, connectInput: PlainCommand?)
            case props(connectOutput: PlainCommand?)
        }
    }
    
    struct Field {
        let name: String
        let type: String
    }
}

extension ListItem.Props {
    
    static let initial = ListItem.Props(
        name: "",
        fields: [],
        kind: .action(connectOutput: nil)
    )
}
