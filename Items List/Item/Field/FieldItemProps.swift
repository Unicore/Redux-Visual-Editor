// Redux Visual Editor
// Created on 13/02/2019 by Max Gribov
//

import Foundation

extension FieldItem {
    
    struct Props {
        let name: String
        let type: String
        let plusButton: Bool
    }
}

extension FieldItem.Props {
    
    static let initial = FieldItem.Props(
        name: "",
        type: "",
        plusButton: false
    )
}
