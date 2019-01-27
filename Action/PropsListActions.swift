

struct AddProps: Action {
    let props: PropsList.Props
}

struct DeleteProps: Action {
    let props: PropsList.Props
}

struct RenameProps: Action {
    let props: PropsList.Props
    let newName: String
}

