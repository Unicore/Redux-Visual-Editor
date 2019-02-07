// Redux Visual Editor
// Created on 29/01/2019 by Max Gribov
//

import Cocoa

class MainScreenViewController: NSViewController {
    
    var props = Props.initial {
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
