extension OverviewViewController {
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
            let activate: Command
            let dismiss: Command
            let name: String
            let updateName: CommandWith<String>
            let status: Status
            
            enum Status {
                case empty
                case valid(save: Command)
                case invalid(reason: String)
            }
        }
    }
}
