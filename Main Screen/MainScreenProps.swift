// Redux Visual Editor
// Created 26.01.19 by Alexey Demedetskiy
//

extension MainScreenViewController {
    
    struct Props {
        let actions: [Action]
        let newAction: NewEntry
        
        let states: [State]
        let newState: NewEntry
        
        let props: [Props]
        let newProps: NewEntry
        
        struct Action {
            let name: String
            let fields: [Field]
            let connectOutput: Command?
        }
        
        struct State {
            let name: String
            let fields: [Field]
            let connectInput: Command?
            let connectOutput: Command?
        }
        
        struct Props {
            let name: String
            let fields: [Field]
            let connectInput: Command?
        }
        
        struct Field {
            let name: String
            let type: String
        }
        
        struct NewEntry {
            /// Should be called by tapping `+` button
            let activate: Command
            
            /// Should be called when tapped outside of new props view
            let dismiss: Command
            
            /// Name that should be renderer
            let name: String
            
            /// Textfield updates should land here
            let updateName: CommandWith<String>
            
            let status: Status
            
            enum Status {
                /// Indicates that name should be provided
                case empty
                
                /// Indictes that name is ok and entry can be saved.
                case valid(save: Command)
                
                /// Indicates that this name cannot be added.
                case invalid(reason: String)
            }
        }
    }
    
}
