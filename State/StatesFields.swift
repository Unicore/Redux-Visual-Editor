// Redux Visual Editor
// Created on 25.01.19 by Maxim Bazarov
//

struct StatesFields {
    let fields: [StatesList.State: [PropsFields.Field]]
    
    static let initial = StatesFields(fields: [:])
}

func reduce(_ old: StatesFields, with action: Action) -> StatesFields {
    return old
}
