struct ActionsFields {
    let fields: [ActionsList.Action: [PropsFields.Field]]
    
    static let initial = ActionsFields(fields: [:])
}

func reduce(_ old: ActionsFields, with action: Action) -> ActionsFields {
    return old
}

