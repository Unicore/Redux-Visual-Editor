// Redux Visual Editor
// Created 04/02/2019 by Max Gribov
//

import Cocoa

class ItemsListViewFlowLayout: NSCollectionViewFlowLayout {
    
    static let itemHeight: CGFloat = 60.0
    static let leftInset: CGFloat = 10.0
    static let rightInset: CGFloat = 10.0
    
    override init() {
        super.init()
        scrollDirection = .vertical
        minimumLineSpacing = 10.0
        minimumInteritemSpacing = 0
        sectionInset = NSEdgeInsets(top: 30, left: ItemsListViewFlowLayout.leftInset, bottom: 55, right: ItemsListViewFlowLayout.rightInset)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
