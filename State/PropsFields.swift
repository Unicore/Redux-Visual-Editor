struct PropsFields {
    let fields: [PropsList.Props: [Field]]
    
    static let initial = PropsFields(fields: [:])
}

func reduce(_ old: PropsFields, with action: Action) -> PropsFields {
    return old
}
