// Redux Visual Editor
// Created on 07.02.19 by Maxim Bazarov
//

import Cocoa

class SplitViewController: NSSplitViewController {
    
    struct Props {
        let actions: ItemsListViewController.Props
        let states: ItemsListViewController.Props
        let props: ItemsListViewController.Props
        
        static let initial = SplitViewController.Props(
            actions: .initial,
            states: .initial,
            props: .initial
        )
    }
    
    @IBOutlet private weak var actionsColumn: NSSplitViewItem?
    @IBOutlet private weak var statesColumn: NSSplitViewItem?
    @IBOutlet private weak var propsColumn: NSSplitViewItem?

    var props = Props.initial {
        didSet {
            guard isViewLoaded else { return }
            render()
        }
    }
    
    override func viewDidLoad() {
        render()
    }
    
    func render() {
        
    }
}
