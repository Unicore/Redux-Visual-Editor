struct StatesFields {
    let fields: [StatesList.State: [PropsFields.Field]]
    
    static let initial = StatesFields(fields: [:])
}

func reduce(_ old: StatesFields, with action: Action) -> StatesFields {
    return old
}
