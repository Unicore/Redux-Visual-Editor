// Redux Visual Editor
// Created on 26.01.19 by Alexey Demedetskiy
//

import Cocoa

extension MainScreenViewController {
    
    struct Props {
        
        let actionsList: ItemsListViewController.Props
        let statesList: ItemsListViewController.Props
        let propsList: ItemsListViewController.Props
        
        let connectSplitVC: Command<NSViewController>
    }
    
}

extension MainScreenViewController.Props {
    
    static let initial = MainScreenViewController.Props(
        actionsList: ItemsListViewController.Props.initial,
        statesList: ItemsListViewController.Props.initial,
        propsList: ItemsListViewController.Props.initial,
        connectSplitVC: .nop
    )
    
}
