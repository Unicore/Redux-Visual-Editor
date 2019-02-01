// Redux Visual Editor
// Created 01.02.19 by Maxim Bazarov
//

extension StatesListViewController {
    
    struct Props {
        
        let list: ItemsListViewController.Props
        
    }
}


// MARK: Initial
extension StatesListViewController.Props {
    
    static let initial = StatesListViewController.Props(
        list: ItemsListViewController.Props.initial
    )
}
