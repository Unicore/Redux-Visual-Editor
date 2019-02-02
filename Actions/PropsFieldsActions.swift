// Redux Visual Editor
// Created on 25.01.19 by Maxim Bazarov
//

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
