struct AddFieldToProps: Action {
    let props: PropsList.Props
    let field: PropsFields.Field
}

struct DeleteFieldFromProps: Action {
    let props: PropsList.Props
    let field: PropsFields.Field
}

struct UpdateFieldInProps: Action {
    let props: PropsList.Props
    let field: PropsFields.Field
    let newField: PropsFields.Field
}
