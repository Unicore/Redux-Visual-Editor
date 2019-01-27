extension OverviewViewController {
    struct Props {
        let actions: [ActionElement]
        let states: [StateElement]
        let props: [PropsElement]
        
        struct ActionElement {
            let name: String
            let fields: [Field]
        }
        
        struct StateElement {
            let name: String
            let fields: [Field]
        }
        
        struct PropsElement {
            let name: String
            let fields: [Field]
        }
        
        struct Field {
            let name: String
            let type: String
        }
    }
}
