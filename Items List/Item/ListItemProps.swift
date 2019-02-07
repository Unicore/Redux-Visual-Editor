// Redux Visual Editor
// Created on 01.02.19 by Maxim Bazarov
//

import Cocoa

extension ListItem {
    
    struct Props {
        let name: String
        let kind: Kind
        
        let fields: [ListItemField.Props]
        
        let connectField: Command<NSCollectionViewItem>
        
        struct NewField {
            /// Should be called by tapping `+` button
            let activate: PlainCommand
            
            /// Should be called when tapped outside of new props view
            let dismiss: PlainCommand
            
            /// Name that should be rendered
            let name: String
            
            /// Textfield updates should land here
            let updateName: Command<String>
            
            let status: Status
            
            enum Status {
                /// Indicates that name should be provided
                case empty
                
                /// Indictes that name is ok and entry can be saved.
                case valid(save: PlainCommand)
                
                /// Indicates that this name cannot be added.
                case invalid(reason: String)
            }
        }
        
        enum Kind {
            case action(connectOutput: PlainCommand?)
            case state(connectOutput: PlainCommand?, connectInput: PlainCommand?)
            case props(connectOutput: PlainCommand?)
        }
    }
    
}

extension ListItem.Props {
    
    static let initial = ListItem.Props(
        name: "",
        kind: .action(connectOutput: nil),
        fields: [],
        connectField: Command<NSCollectionViewItem> { field in print("Connected field: \(field)") }
    )
}
