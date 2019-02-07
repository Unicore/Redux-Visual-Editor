// Redux Visual Editor
// Created on 01.02.19 by Maxim Bazarov
//

import Cocoa

extension ItemsListViewController {
    
    struct Props {
        
        let items: [ListItem.Props]
        let newEntry: NewEntry
        
        let connectItem: Command<NSCollectionViewItem>
        
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
        ),
        connectItem: .nop
    )
}

// MARK: Initial
extension ItemsListViewController.Props {
    
    static private let connectFieldOP = Command<NSCollectionViewItem> { field in print("Connected field: \(field)") }
    static private let connectItemOP = Command<NSCollectionViewItem> { item in print("Connected item: \(item)") }
    
    static let showCase = ItemsListViewController.Props(
        items: [
            ListItem.Props(
                name: "Action1",
                kind: .action(connectOutput: .nop),
                fields: [
                    ListItemField.Props(
                        name: "name", nameState: .ok(rename: Command<String>{print($0)}),
                        type: "String", typeState: .ok(rename: Command<String>{print($0)}),
                        delete: PlainCommand{print("delete field: name: String from Action1")}
                    ),
                    ListItemField.Props(
                        name: "surname", nameState: .ok(rename: Command<String>{print($0)}),
                        type: "String", typeState: .ok(rename: Command<String>{print($0)}),
                        delete: PlainCommand{print("delete field: surname: String from Action1")}
                    ),
                    ListItemField.Props(
                        name: "x", nameState: .ok(rename: Command<String>{print($0)}),
                        type: "Int", typeState: .ok(rename: Command<String>{print($0)}),
                        delete: PlainCommand{print("delete field: x: Int from Action1")}
                    ),
                    
                    ],
                connectItem: connectItemOP
            ),
            ListItem.Props(
                name: "ActionTwo",
                kind: .action(connectOutput: .nop),
                fields: [
                    ListItemField.Props(
                        name: "id", nameState: .ok(rename: Command<String>{print($0)}),
                        type: "String", typeState: .ok(rename: Command<String>{print($0)}),
                        delete: PlainCommand{print("delete field: id: String from ActionTwo")}
                    ),
                    ListItemField.Props(
                        name: "state", nameState: .ok(rename: Command<String>{print($0)}),
                        type: ": State; enum State {\n    let s: String\n    let x: Int\n}", typeState: .ok(rename: Command<String>{print($0)}),
                        delete: PlainCommand{print("delete field: state from ActionTwo")}
                    ),
                    ListItemField.Props(
                        name: "x", nameState: .ok(rename: Command<String>{print($0)}),
                        type: "Int", typeState: .ok(rename: Command<String>{print($0)}),
                        delete: PlainCommand{print("delete field: x: Int from ActionTwo")}
                    )
                ], connectItem: connectItemOP
            ),
            
            ],
        newEntry: ItemsListViewController.Props.NewEntry(
            activate: PlainCommand{},
            dismiss: PlainCommand{},
            name: "",
            updateName: Command<String>{ _ in },
            status: .empty
        ),
        connectItem: connectItemOP
    )
}
