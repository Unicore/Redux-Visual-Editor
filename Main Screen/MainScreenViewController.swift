// Redux Visual Editor
// Created on 29/01/2019 by Max Gribov
//

import Cocoa

class MainScreenViewController: NSViewController {
    
    struct Props {
        let split: SplitViewController.Props
        let footer: FooterViewController.Props
        
        static let initial = Props(
            split: .initial,
            footer: .initial
        )
    }
    
    private var split: SplitViewController?
    private var footer: FooterViewController?
    
    var props: Props = .initial {
        didSet {
            guard isViewLoaded else { return }
            render()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        render()
    }
    
    private func render() {
        
    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch (segue.destinationController) {
        case let dest as SplitViewController where segue.identifier == "embedSplitVC":
            self.split = dest
            dest.props = props.split
        
        case let dest as FooterViewController where segue.identifier == "embedFooter":
            self.footer = dest
            dest.props = props.footer
            
        default: fatalError("Unexpected segue in main vc: \(segue)")
        }
    }
}
