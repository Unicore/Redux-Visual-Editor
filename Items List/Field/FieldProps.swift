// Redux Visual Editor
// Created on 07.02.19 by Maxim Bazarov
//


extension ListItemField {
    
    struct Props {

        let name: String
        let nameState: State
        
        let type: String
        let typeState: State
        
        let delete: PlainCommand
        
        enum State {
            
            /// Operational
            case ok(rename: Command<String>)
            
            /// Indicates that name should be provided
            case empty(updateName: Command<String>)
            
            /// Indictes that name is ok and entry can be saved.
            case valid(save: PlainCommand)
            
            /// Indicates that this name cannot be added.
            case invalid(reason: String, updateName: Command<String>)
            
        }
    }
}
