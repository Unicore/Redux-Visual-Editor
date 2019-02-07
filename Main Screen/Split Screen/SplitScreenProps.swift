// Redux Visual Editor
// Created on 07.02.19 by Maxim Bazarov
//

import Cocoa

extension SplitViewController {
    
    struct Props {
        let connectActionList: CommandOf<NSViewController>
        let connectStatesList: CommandOf<NSViewController>
        let connectPropsList: CommandOf<NSViewController>
    }
}

extension SplitViewController.Props {
    
    static let printVC = CommandOf<NSViewController>{ vc in
        print("[VC] connected \(vc)")
    }
    
    static let initial = SplitViewController.Props(
        connectActionList: CommandOf<NSViewController>{ vc in print("Connect actions VC: \(vc)")},
        connectStatesList: CommandOf<NSViewController>{ vc in print("Connect states VC: \(vc)")},
        connectPropsList: CommandOf<NSViewController>{ vc in print("Connect props VC: \(vc)")}
    )
}
