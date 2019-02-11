// Redux Visual Editor
// Created on 29/01/2019 by Max Gribov
//

import Cocoa

class MainScreenViewController: NSViewController {
    
    struct Props {
        let actionsList: ItemsListViewController.Props
        let statesList: ItemsListViewController.Props
        let propsList: ItemsListViewController.Props
        
        let connectSplitVC: CommandOf<NSViewController>
    }
    
    var props = MainScreenViewController.Props(
        actionsList: ItemsListViewController.Props.initial,
        statesList: ItemsListViewController.Props.initial,
        propsList: ItemsListViewController.Props.initial,
        connectSplitVC: .nop
    ) {
        didSet {
            guard isViewLoaded else { return }
            render()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        render()
    }
    
    private func render() {}
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == "embedSplitVC"
        , let destination = segue.destinationController as? NSViewController {
            props.connectSplitVC.execute(with: destination)
        }
    }
}
