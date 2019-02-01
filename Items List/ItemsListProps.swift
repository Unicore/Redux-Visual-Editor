// Redux Visual Editor
// Created 01.02.19 by Maxim Bazarov
//


extension ItemsListViewController {
    
    struct Props {
        
        let items: [Item]
        let newEntry: NewEntry
        
        
        // MARK: - Structs
        struct Item {
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
        
        struct NewEntry {
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
    }
    
}


// MARK: Initial
extension ItemsListViewController.Props {
    
    static let initial = ItemsListViewController.Props(
        items: [],
        newEntry: ItemsListViewController.Props.NewEntry(
            activate: PlainCommand{},
            dismiss: PlainCommand{},
            name: "",
            updateName: Command<String>{ _ in },
            status: .empty
    ))
}
