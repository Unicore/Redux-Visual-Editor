
// MARL: Props
struct AddProps: Action {
    let name: String
}

struct DeleteProps: Action {
    let name: String
}

struct RenameProps: Action {
    let name: String
}

// MARK: Fields
struct AddFieldToProps: Action {
    let name: String
    let type: String
}

struct DeleteFieldFromProps: Action {
    let fieldName: String
    let propsName: String
}

struct RenameFieldInProps: Action {
    let propsName: String
    let oldFieldName: String
    let newFieldName: String
}

// MARK: Links
struct AddStatePropsLink {
    let stateName: String
    let propsName: String
}

struct DeleteStatePropsLink {
    let stateName: String
    let propsName: String
}
