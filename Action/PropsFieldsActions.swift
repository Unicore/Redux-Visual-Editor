

struct AddFieldToProps: Action {
    let name: String
    let type: String
}

struct DeleteFieldFromProps: Action {
    let name: String
}
