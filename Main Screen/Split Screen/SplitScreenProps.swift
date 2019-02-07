// Redux Visual Editor
// Created on 07.02.19 by Maxim Bazarov
//

import Cocoa

extension SplitViewController {
    
    struct Props {
        let connectActionList: Command<NSViewController>
        let connectStatesList: Command<NSViewController>
        let connectPropsList: Command<NSViewController>
    }
}

extension SplitViewController.Props {
    
    static let printVC = Command<NSViewController>{ vc in
        print("[VC] connected \(vc)")
    }
    
    static let initial = SplitViewController.Props(
        connectActionList: Command<NSViewController>{ vc in print("Connect actions VC: \(vc)")},
        connectStatesList: Command<NSViewController>{ vc in print("Connect states VC: \(vc)")},
        connectPropsList: Command<NSViewController>{ vc in print("Connect props VC: \(vc)")}
    )
}
