// Redux Visual Editor
// Created on 07.02.19 by Maxim Bazarov
//


extension ListItemField {
    
    struct Props {

        let name: String
        let nameState: State
        
        let type: String
        let typeState: State
        
        let delete: Command
        
        enum State {
            
            /// Operational
            case ok(rename: CommandOf<String>)
            
            /// Indicates that name should be provided
            case empty(updateName: CommandOf<String>)
            
            /// Indictes that name is ok and entry can be saved.
            case valid(save: Command)
            
            /// Indicates that this name cannot be added.
            case invalid(reason: String, updateName: CommandOf<String>)
            
        }
    }
}
