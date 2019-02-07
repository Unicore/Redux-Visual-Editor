// Redux Visual Editor
// Created on 07.02.19 by Maxim Bazarov
//

import Cocoa

class SplitViewController: NSSplitViewController {
    
    var props = Props.initial
    
    @IBOutlet weak var actionsColumn: NSSplitViewItem! {
        didSet {
            guard let controller = actionsColumn?.viewController else { return }
            props.connectActionList.execute(with: controller)
        }
    }
    
    @IBOutlet weak var statesColumn: NSSplitViewItem! {
        didSet {
            guard let controller = statesColumn?.viewController else { return }
            props.connectStatesList.execute(with: controller)
        }
    }
    
    @IBOutlet weak var propsColumn: NSSplitViewItem! {
        didSet {
            guard let controller = propsColumn?.viewController else { return }
            props.connectPropsList.execute(with: controller)
        }
    }
    
}
