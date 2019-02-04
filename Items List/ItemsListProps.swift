// Redux Visual Editor
// Created on 01.02.19 by Maxim Bazarov
//


extension ItemsListViewController {
    
    struct Props {
        
        let items: [ListItem.Props]
        let newEntry: NewEntry
        
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

// MARK: Initial
extension ItemsListViewController.Props {
    
    static let showCase = ItemsListViewController.Props(
        items: [
            ListItem.Props(
                name: "ActionOne",
                fields: [],
                kind: .action(connectOutput: nil)
            ),
            ListItem.Props(
                name: "StateOne",
                fields: [
                    ListItem.Field(
                        name: "property",
                        type: "String"
                    ),
                    ListItem.Field(
                        name: "static let a",
                        type: "Int"
                    )
                ],
                kind: .state(connectOutput: nil, connectInput: nil)
            ),
            ListItem.Props(
                name: "PropsOne",
                fields: [
                    ListItem.Field(
                        name: "property",
                        type: "String"
                    ),
                    ListItem.Field(
                        name: "static let a",
                        type: "Int"
                    ),
                    ListItem.Field(
                        name: "static let a",
                        type: "Int"
                    )
                ],
                kind: .props(connectOutput: nil)
            ),

            ],
        newEntry: ItemsListViewController.Props.NewEntry(
            activate: PlainCommand{},
            dismiss: PlainCommand{},
            name: "",
            updateName: Command<String>{ _ in },
            status: .empty
        )
    )
}
