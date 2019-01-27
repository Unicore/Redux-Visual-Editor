struct PropsFields {
    let fields: [PropsList.Props: [Field]]
    
    struct Field {
        let name: String
        let type: String
    }
    
    static let initial = PropsFields(fields: [:])
}

func reduce(_ old: PropsFields, with action: Action) -> PropsFields {
    switch action {
    
    case let payload as AddFieldToProps:
        if old.fields.keys.contains(where: { $0.rawValue == payload.name })  {
            // TODO: Error handling
            return old
        }
        
        var newFields = old.fields
        let field = PropsFields.Field(name: payload.name, type: payload.type)
        newFields[PropsList.Props(rawValue: payload.name)] = [field]
        return PropsFields(fields: newFields)

    case let payload as DeleteFieldFromProps:
        let propsToEdit = PropsList.Props(rawValue: payload.fieldName)
        var newFields = old.fields
        guard let oldFields = old.fields[propsToEdit] else { return old }
        newFields[propsToEdit] = oldFields.filter { $0.name != payload.fieldName }
        return PropsFields(fields: newFields)

    default:
        return old
    }
}
