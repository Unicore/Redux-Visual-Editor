// Redux Visual Editor
// Created 01.02.19 by Maxim Bazarov
//

extension PropsListViewController {
    
    struct Props {
        
        let list: ItemsListViewController.Props
        
    }
}


// MARK: Initial
extension PropsListViewController.Props {
    
    static let initial = PropsListViewController.Props(
        list: ItemsListViewController.Props.initial
    )
}
