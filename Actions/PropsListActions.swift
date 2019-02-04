// Redux Visual Editor
// Created on 25.01.19 by Maxim Bazarov
//

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

