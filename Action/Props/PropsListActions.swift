
// MARL: Props
struct AddProps: Action {
    let props: PropsList.Props
}

struct DeleteProps: Action {
    let name: String
}

struct RenameProps: Action {
    let oldName: String
    let newName: String
}

