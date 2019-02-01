// Redux Visual Editor
// Created 01.02.19 by Maxim Bazarov
//


extension ActionsListViewController {
    
    struct Props {
        
        let list: ItemsListViewController.Props
        
    }
}


// MARK: Initial
extension ActionsListViewController.Props {
    
    static let initial = ActionsListViewController.Props(
        list: ItemsListViewController.Props.initial
    )
}
