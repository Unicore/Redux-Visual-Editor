// Redux Visual Editor
// Created on 25.01.19 by Maxim Bazarov
//

struct PropsFields {
    let fields: [PropsList.Props: [Field]]
    
    struct Field: Equatable {
        let name: String
        let type: String
    }
    
    static let initial = PropsFields(fields: [:])
}

func reduce(_ old: PropsFields, with action: Action) -> PropsFields {
    switch action {
    
    case let payload as AddFieldToProps:
        // check if there is these props
        if !old.fields.keys.contains(payload.props)  {
            // TODO: Error handling
            return old
        }
        var newFields = old.fields
        newFields[payload.props] = [payload.field]
        return PropsFields(fields: newFields)

    case let payload as DeleteFieldFromProps:
        var newFields = old.fields
        guard let oldFields = old.fields[payload.props] else { return old }
        newFields[payload.props] = oldFields.filter { $0 != payload.field }
        return PropsFields(fields: newFields)

    case let payload as UpdateFieldInProps:
        var newFields = old.fields
        guard let oldFieldsList = old.fields[payload.props] else { return old }
        newFields[payload.props] = oldFieldsList.map { field in
            return field == payload.field ? payload.newField : field
        }
        return PropsFields(fields: newFields)

    default:
        return old
    }
}
